//-----------------------------------------------------------------------------
//
//    ** DO NOT EDIT THIS FILE! **
//    This file was generated by a tool
//    re-running the tool will overwrite this file.
//
//-----------------------------------------------------------------------------

#include "nf_lib.h"
#include "nf_lib_nf_lib_Display_LiquidCrystal_I2C.h"

using namespace nf_lib::nf_lib;


HRESULT Library_nf_lib_nf_lib_Display_LiquidCrystal_I2C::NativeTest___STATIC__BOOLEAN__BOOLEAN( CLR_RT_StackFrame& stack )
{
    NANOCLR_HEADER(); hr = S_OK;
    {

        bool param0;
        NANOCLR_CHECK_HRESULT( Interop_Marshal_bool( stack, 0, param0 ) );

        bool retValue = Display_LiquidCrystal_I2C::NativeTest( param0, hr );
        NANOCLR_CHECK_HRESULT( hr );
        SetResult_bool( stack, retValue );
    }
    NANOCLR_NOCLEANUP();
}
