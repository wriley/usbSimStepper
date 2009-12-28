#include <stdlib.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/eeprom.h>
#include <avr/wdt.h>

#include "usbdrv.h"
#include "oddebug.h"
#include <util/delay.h>

// Uncomment if instrument is meant to go in continuous circles, such as a gyrocompass
// Comment out for instruments such as ASI
//#define FULLCIRCLE

// Uncomment to support second stepper motor, opto and encoder
//#define MOTOR2

#define ENCODER1PORT            PORTD
#define ENCODER1DDR             DDRD
#define ENCODER1PIN             PIND
#define PHASE_A_1               (ENCODER1PIN & 1<<1)
#define PHASE_B_1               (ENCODER1PIN & 1<<0)
#define OPTO1PORT               PORTB
#define OPTO1DDR                DDRB
#define OPTO1PIN                PINB
#define OPTO1                   (OPTO1PIN & 1<<3)
#define MOTOR1PORT              PORTC
#define MOTOR1DDR               DDRC
#define MOTOR1MASK				0x0f

#define CMD_ECHO				0
#define CMD_SET1				1
#define CMD_SET2				2
#define CMD_GET_TABLE			10
#define CMD_SET_TABLE			11
#define CMD_GET_TABLERAW		20
#define CMD_SET_TABLERAW		21
#ifdef MOTOR2
#define CMD_GET_TABLE2			30
#define CMD_SET_TABLE2			31
#define CMD_GET_TABLERAW2		40
#define CMD_SET_TABLERAW2		41
#endif
#define CMD_RESET				99

#ifdef MOTOR2
#define ENCODER2PORT            PORTD
#define ENCODER2DDR             DDRD
#define ENCODER2PIN             PIND
#define PHASE_A_2               (ENCODER2PIN & 1<<1)
#define PHASE_B_2               (ENCODER2PIN & 1<<0)
#define OPTO2PORT               PORTB
#define OPTO2DDR                DDRB
#define OPTO2PIN                PINB
#define OPTO2                   (OPTO2PIN & 1<<3)
#define MOTOR2PORT              PORTC
#define MOTOR2DDR               DDRC
#define MOTOR2MASK				0x0f
#endif

#define FORWARD                 0
#define REVERSE                 1
#define HALFWAY					199
#define MAXPOS					399
#define EEPROM_SERIAL_LOCATION	0

#define EEPROM_TABLE_LOCATION		8
#define EEPROM_TABLERAW_LOCATION	72
#ifdef MOTOR2
#define EEPROM_TABLE2_LOCATION		136
#define EEPROM_TABLERAW2_LOCATION	200
#endif

// positions for half stepping bipolar
static char motorPositions[8] = {
    0x09,   // 0 0 0 0  1 0 0 1
    0x01,   // 0 0 0 0  0 0 0 1
    0x05,   // 0 0 0 0  0 1 0 1
    0x04,   // 0 0 0 0  0 1 0 0
    0x06,   // 0 0 0 0  0 1 1 0
    0x02,   // 0 0 0 0  0 0 1 0
    0x0a,   // 0 0 0 0  1 0 1 0
    0x08    // 0 0 0 0  1 0 0 0
};

static int16_t last1;
static int16_t position1 = 0;
static int16_t newposition1 = 0;
static int8_t mtr_direction1 = REVERSE;
static int16_t stepCounter1 = 0;
static int16_t mtr_delta1 = 0x0000;
static int8_t goHome1 = 0x02;
static int16_t testCount1 = 0;

#ifdef MOTOR2
static int16_t last2;
static int16_t position2 = 0;
static int16_t newposition2 = 0;
static int8_t mtr_direction2 = REVERSE;
static int16_t stepCounter2 = 0;
static int16_t mtr_delta2 = 0x0000;
static int8_t goHome2 = 0x02;
static int16_t testCount2 = 0;
#endif

#define SERIAL_NUMBER_LENGTH 1
static int  serialNumberDescriptor[SERIAL_NUMBER_LENGTH + 1];

static void SetSerial(void)
{
   serialNumberDescriptor[0] = USB_STRING_DESCRIPTOR_HEADER(SERIAL_NUMBER_LENGTH);
   serialNumberDescriptor[1] = eeprom_read_byte(EEPROM_SERIAL_LOCATION);
}

USB_PUBLIC uchar usbFunctionSetup(uchar data[8])
{
usbRequest_t    *rq = (void *)data;
static uchar    replyBuf[8];

    usbMsgPtr = replyBuf;
    if(rq->bRequest == CMD_ECHO){
        replyBuf[0] = rq->wValue.bytes[0];
        replyBuf[1] = rq->wValue.bytes[1];
        return 2;
    } else if(rq->bRequest == CMD_SET1){
		newposition1 = 0x0000;
		newposition1 <<= 8;
        newposition1 |= rq->wValue.bytes[1];
		newposition1 <<= 8;
        newposition1 |= rq->wValue.bytes[0];
#ifdef MOTOR2
	} else if(rq->bRequest == CMD_SET2){
		newposition2 = 0x0000;
		newposition2 <<= 8;
        newposition2 |= rq->wValue.bytes[1];
		newposition2 <<= 8;
        newposition2 |= rq->wValue.bytes[0];
#endif
    } else if(rq->bRequest == CMD_GET_TABLE){
		for(uchar i = 0; i < 8; i++){
			replyBuf[i] = eeprom_read_byte(EEPROM_TABLE_LOCATION + (rq->wValue.bytes[0] * 8) + i);
		}
		return 8;
    } else if(rq->bRequest == CMD_SET_TABLE){
		eeprom_write_byte(EEPROM_TABLE_LOCATION + (rq->wValue.bytes[0] * 8) + (rq->wValue.bytes[1]), rq->wIndex.bytes[0]);
	} else if(rq->bRequest == CMD_GET_TABLERAW){
		for(uchar i = 0; i < 8; i++){
			replyBuf[i] = eeprom_read_byte(EEPROM_TABLERAW_LOCATION + (rq->wValue.bytes[0] * 8) + i);
		}
		return 8;
    } else if(rq->bRequest == CMD_SET_TABLERAW){
		eeprom_write_byte(EEPROM_TABLERAW_LOCATION + (rq->wValue.bytes[0] * 8) + (rq->wValue.bytes[1]), rq->wIndex.bytes[0]);
#ifdef MOTOR2
    } else if(rq->bRequest == CMD_GET_TABLE2){
		for(uchar i = 0; i < 8; i++){
			replyBuf[i] = eeprom_read_byte(EEPROM_TABLE2_LOCATION + (rq->wValue.bytes[0] * 8) + i);
		}
		return 8;
    } else if(rq->bRequest == CMD_SET_TABLE2){
		eeprom_write_byte(EEPROM_TABLE2_LOCATION + (rq->wValue.bytes[0] * 8) + (rq->wValue.bytes[1]), rq->wIndex.bytes[0]);
	} else if(rq->bRequest == CMD_GET_TABLERAW2){
		for(uchar i = 0; i < 8; i++){
			replyBuf[i] = eeprom_read_byte(EEPROM_TABLERAW2_LOCATION + (rq->wValue.bytes[0] * 8) + i);
		}
		return 8;
    } else if(rq->bRequest == CMD_SET_TABLERAW2){
		eeprom_write_byte(EEPROM_TABLERAW2_LOCATION + (rq->wValue.bytes[0] * 8) + (rq->wValue.bytes[1]), rq->wIndex.bytes[0]);
#endif
	} else if(rq->bRequest == CMD_RESET){
		newposition1 = 0;
		position1 = 0;
		goHome1 = 2;
    }
    return 0;
}

uchar usbFunctionDescriptor(usbRequest_t *rq)
{
   uchar len = 0;
   usbMsgPtr = 0;
   if (rq->wValue.bytes[1] == USBDESCR_STRING && rq->wValue.bytes[0] == 3)
   {
      usbMsgPtr = (uchar*)serialNumberDescriptor;
      len = sizeof(serialNumberDescriptor);
   }
   return len;
}

SIGNAL (SIG_OUTPUT_COMPARE2)                // 1ms
{
    int16_t new1, diff1;

    new1 = 0;
    if( PHASE_A_1 )
        new1 = 3;
    if( PHASE_B_1 )
        new1 ^= 1;                          // convert gray to binary
    diff1 = last1 - new1;                   // difference last - new
    if( diff1 & 1 ){                        // bit 0 = value (1)
        last1 = new1;                       // store new as next last
		position1 += (diff1 & 2) - 1;		// update position1
    }

#ifdef MOTOR2
	int16_t new2, diff2;

    new2 = 0;
    if( PHASE_A_2 )
        new2 = 3;
    if( PHASE_B_2 )
        new2 ^= 1;                          // convert gray to binary
    diff2 = last2 - new2;                   // difference last - new
    if( diff2 & 1 ){                        // bit 0 = value (1)
        last2 = new2;                       // store new as next last
		position2 += (diff2 & 2) - 1;		// update position1
    }
#endif

    if(goHome1 > 0)
    {
		if(goHome1 == 3) // test mode
		{
			if(testCount1 < MAXPOS)
			{
				testCount1++;
				stepCounter1++;
				stepCounter1 &= 0x07;
            	MOTOR1PORT = motorPositions[stepCounter1] & MOTOR1MASK;
			}
			else
			{
				goHome1 = 4;
			}
		}

        if(goHome1 == 2) // move forward until opto is not dark
        {
            if(OPTO1PIN & OPTO1) // dark
            {
                stepCounter1++;
				stepCounter1 &= 0x07;
                MOTOR1PORT = motorPositions[stepCounter1] & MOTOR1MASK;
            }
            else
            {
                goHome1 = 1;
            }
        }
        
        if(goHome1 == 1) // move backward until opto is dark
        {
            if(OPTO1PIN & OPTO1) // dark
            {
                goHome1 = 0;
            }
            else
            {
                stepCounter1--;
				stepCounter1 &= 0x07;
                MOTOR1PORT = motorPositions[stepCounter1] & MOTOR1MASK;
            }
        }
    }
    else
    {
		if(newposition1 > MAXPOS) { newposition1 = MAXPOS; }
		if(newposition1 < 0) { newposition1 = 0; }
        mtr_delta1 = newposition1 - position1;
        if(mtr_delta1 != 0)
        {
            if(mtr_delta1 < 0)
            {
                mtr_direction1 = REVERSE;
            }
            else
            {
                mtr_direction1 = FORWARD;
            }

#ifdef FULLCIRCLE
            if(abs(mtr_delta1) > HALFWAY)
            {
                if(mtr_direction1 == FORWARD)
                {
                    mtr_direction1 = REVERSE;
                } else if(mtr_direction1 == REVERSE)
				{
					mtr_direction1 = FORWARD;
				}
            }
#endif

            if(mtr_direction1 == REVERSE)
            {
                position1--;
#ifdef FULLCIRCLE
				if(position1 < 0){ position1 = MAXPOS; }
#else
				if(position1 < 0){ position1 = 0; }
#endif
                stepCounter1--;
            }
            else
            {
                position1++;
#ifdef FULLCIRCLE
                if(position1 > MAXPOS){ position1 = 0; }
#else
				if(position1 > MAXPOS){ position1 = MAXPOS; }
#endif
				stepCounter1++;
            }
            
			stepCounter1 &= 0x07;
            MOTOR1PORT = motorPositions[stepCounter1] & MOTOR1MASK;
        }
    }

#ifdef MOTOR2
    if(goHome2 > 0)
    {
		if(goHome2 == 3) // test mode
		{
			if(testCount2 < MAXPOS)
			{
				testCount2++;
				stepCounter2++;
				stepCounter2 &= 0x07;
            	MOTOR2PORT = motorPositions[stepCounter2] & MOTOR2MASK;
			}
			else
			{
				goHome2 = 4;
			}
		}

        if(goHome2 == 2) // move forward until opto is not dark
        {
            if(OPTO2PIN & OPTO2) // dark
            {
                stepCounter2++;
				stepCounter2 &= 0x07;
                MOTOR2PORT = motorPositions[stepCounter2] & MOTOR2MASK;
            }
            else
            {
                goHome2 = 1;
            }
        }
        
        if(goHome2 == 1) // move backward until opto is dark
        {
            if(OPTO2PIN & OPTO2) // dark
            {
                goHome2 = 0;
            }
            else
            {
                stepCounter2--;
				stepCounter2 &= 0x07;
                MOTOR2PORT = motorPositions[stepCounter2] & MOTOR2MASK;
            }
        }
    }
    else
    {
		if(newposition2 > MAXPOS) { newposition2 = MAXPOS; }
		if(newposition2 < 0) { newposition2 = 0; }
        mtr_delta2 = newposition2 - position2;
        if(mtr_delta2 != 0)
        {
            if(mtr_delta2 < 0)
            {
                mtr_direction2 = REVERSE;
            }
            else
            {
                mtr_direction2 = FORWARD;
            }

#ifdef FULLCIRCLE
            if(abs(mtr_delta2) > HALFWAY)
            {
                if(mtr_direction2 == FORWARD)
                {
                    mtr_direction2 = REVERSE;
                } else if(mtr_direction2 == REVERSE)
				{
					mtr_direction2 = FORWARD;
				}
            }
#endif

            if(mtr_direction2 == REVERSE)
            {
                position2--;
#ifdef FULLCIRCLE
				if(position2 < 0){ position2 = MAXPOS; }
#else
				if(position2 < 0){ position2 = 0; }
#endif
                stepCounter2--;
            }
            else
            {
                position2++;
#ifdef FULLCIRCLE
                if(position2 > MAXPOS){ position2 = 0; }
#else
				if(position2 > MAXPOS){ position2 = MAXPOS; }
#endif
				stepCounter2++;
            }
            
			stepCounter2 &= 0x07;
            MOTOR2PORT = motorPositions[stepCounter2] & MOTOR2MASK;
        }
    }
#endif
}

int main(void)
{
	uchar   i;

	SetSerial();

    wdt_enable(WDTO_1S);
    odDebugInit();
    DDRD = ~(1 << 2);   /* all outputs except PD2 = INT0 */
    PORTD = 0;
    PORTB = 0;          /* no pullups on USB pins */
/* We fake an USB disconnect by pulling D+ and D- to 0 during reset. This is
 * necessary if we had a watchdog reset or brownout reset to notify the host
 * that it should re-enumerate the device. Otherwise the host's and device's
 * concept of the device-ID would be out of sync.
 */
    DDRB = ~USBMASK;    /* set all pins as outputs except USB */
    usbDeviceDisconnect();  /* enforce re-enumeration, do this while interrupts are disabled! */
    i = 0;
    while(--i){         /* fake USB disconnect for > 500 ms */
        wdt_reset();
        _delay_ms(2);
    }
    usbDeviceConnect();
    TCCR0 = 5;          /* set prescaler to 1/1024 */
    usbInit();

	DDRB &= ~(_BV(PB3));
	PORTB |= _BV(PB3);
	
	DDRD &= ~(_BV(PD0)|_BV(PD1));
	PORTD |= (_BV(PD0)|_BV(PD1));

	TCNT2 = 0x00; /* Timer 2: Reset counter (periodic timer) */
	TCCR2 = 0x0f; /* Clock / 1024, clear after compare match (CTC) */
	OCR2 = 0x0b;

	TIMSK |= _BV(OCIE2);

	DDRC = 0x2f;
	PORTC = 0x2f;

    sei();
    for(;;){    /* main event loop */
        wdt_reset();
        usbPoll();
    }
    return 0;
}
