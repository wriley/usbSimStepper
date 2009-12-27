using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using ICSharpCode.USBlib;
using System.Runtime.InteropServices;

namespace usbSimStepperTest
{
    public partial class Form1 : Form
    {
        Device device;

        const int VENDOR_ID = 0x16C0;
        const int PRODUCT_ID = 0x05DC;
        const int INPUT_REPORT_SIZE = 16;
        const int OUTPUT_REPORT_SIZE = 16;
        const int CMD_ECHO = 0;
        const int CMD_SET = 1;
        const int CMD_GETID = 3;
        const int CMD_SETID = 4;
        const int CMD_RESET = 9;

        byte[] inputReportBuffer = new byte[INPUT_REPORT_SIZE];
        byte[] outputReportBuffer = new byte[OUTPUT_REPORT_SIZE];

        // Standard requests
        public const int USB_REQ_GET_STATUS = 0x00;
        public const int USB_REQ_CLEAR_FEATURE = 0x01;

        // 0x02 is reserved 
        public const int USB_REQ_SET_FEATURE = 0x03;

        // 0x04 is reserved
        public const int USB_REQ_SET_ADDRESS = 0x05;
        public const int USB_REQ_GET_DESCRIPTOR = 0x06;
        public const int USB_REQ_SET_DESCRIPTOR = 0x07;
        public const int USB_REQ_GET_CONFIGURATION = 0x08;
        public const int USB_REQ_SET_CONFIGURATION = 0x09;
        public const int USB_REQ_GET_INTERFACE = 0x0A;
        public const int USB_REQ_SET_INTERFACE = 0x0B;
        public const int USB_REQ_SYNCH_FRAME = 0x0C;

        public const int USB_TYPE_STANDARD = (0x00 << 5);
        public const int USB_TYPE_CLASS = (0x01 << 5);
        public const int USB_TYPE_VENDOR = (0x02 << 5);
        public const int USB_TYPE_RESERVED = (0x03 << 5);

        public const int USB_RECIP_DEVICE = 0x00;
        public const int USB_RECIP_INTERFACE = 0x01;
        public const int USB_RECIP_ENDPOINT = 0x02;
        public const int USB_RECIP_OTHER = 0x03;

        // Various libusb API related stuff
        public const int USB_ENDPOINT_IN = 0x80;
        public const int USB_ENDPOINT_OUT = 0x00;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            FindDevices();
        }

        void FindDevices()
        {
            debugText("Searching...");
            try
            {
                foreach (Bus bus in Bus.Busses)
                {
                    foreach (Descriptor descriptor in bus.Descriptors)
                    {
                        debugText(String.Format("Found HID: vid_{0:x4} pid_{1:x4} {2}",
                            descriptor.VendorId,
                            descriptor.ProductId,
                            descriptor.FileName
                            ));

                        if (descriptor.VendorId == VENDOR_ID &&
                            descriptor.ProductId == PRODUCT_ID)
                        {
                            device = descriptor.OpenDevice();
                            debugText(String.Format("Found device - Manufacturer: {0} Product: {1} Serial: {2}", device.Manufacturer, device.Product, device.SerialNumber));
                            return;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                debugText("Exception: " + ex.Message);
            }
        }

        bool CheckInitialization()
        {
            if (IsInitialized)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool IsInitialized
        {
            get
            {
                return device != null;
            }
        }

        void debugText(String s)
        {
            infoBox.Items.Add(System.DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.ffff") + "  " + s);
            infoBox.SelectedIndex = infoBox.Items.Count - 1;
            infoBox.SelectedIndex = -1;
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            trackBar1.Value = Int16.Parse(textBox1.Text);
            if (CheckInitialization())
            {
                int val = 0, index = 0;
                val = (int)Int16.Parse(textBox1.Text);
                debugText("Writing: " + val.ToString());
                byte[] buffer = new byte[8];
                try
                {
                    device.SendControlMessage(USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_ENDPOINT_IN, CMD_SET, val, index, buffer);
                }
                catch (Exception ex)
                {
                    debugText("Exception: " + ex.Message);
                }
            }
        }

        private void trackBar1_Scroll(object sender, EventArgs e)
        {
            textBox1.Text = trackBar1.Value.ToString();
            if (CheckInitialization())
            {
                int val = 0, index = 0;
                val = (int)trackBar1.Value;
                debugText("Writing: " + val.ToString());
                byte[] buffer = new byte[8];
                try
                {
                    device.SendControlMessage(USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_ENDPOINT_IN, CMD_SET, val, index, buffer);
                }
                catch (Exception ex)
                {
                    debugText("Exception: " + ex.Message);
                }
            }
        }

        private void button_reset_Click(object sender, EventArgs e)
        {
            textBox1.Text = "0";
            trackBar1.Value = 0;
            if (CheckInitialization())
            {
                int val = 0, index = 0;
                debugText("Resetting");
                byte[] buffer = new byte[8];
                try
                {
                    device.SendControlMessage(USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_ENDPOINT_IN, CMD_RESET, val, index, buffer);
                }
                catch (Exception ex)
                {
                    debugText("Exception: " + ex.Message);
                }
            }
        }
    }
}
