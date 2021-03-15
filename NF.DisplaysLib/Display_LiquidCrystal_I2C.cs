using System.Runtime.CompilerServices;

namespace NF.DisplaysLib
{
    public class Display_LiquidCrystal_I2C
    {
        public bool Test(bool input)
        {
            return NativeTest(input);
        }

        [MethodImpl(MethodImplOptions.InternalCall)]
        private static extern bool NativeTest(bool input);
    }
}
