/*==============================================================================
Filename:
Project :
Author  :
Version :
Purpose
--------------------------------------------------------------------------------

Version History
--------------------------------------------------------------------------------

License
--------------------------------------------------------------------------------
The copyrights, all other intellectual and industrial property rights are
retained by XMOS and/or its licensors.
Terms and conditions covering the use of this code can be found in the Xmos
End User License Agreement.

Copyright XMOS Ltd 2011

In the case where this code is a modification of existing code under a
separate license, the separate license terms are shown below. The
modifications to the code are still covered by the copyright notice above.
==============================================================================*/

/*------------------------------------------------------------------------------
Include files
------------------------------------------------------------------------------*/
#include <xs1.h>
#include <print.h>
#include "xmodbus.h"
#include "modbus_tcp_server.h"
#include "xtcp_client.h"

/*------------------------------------------------------------------------------
Extern Variables
------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------
Manifest constants
------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------
Typedefs
------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------
Global Variables
------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------
Static Variables
------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------
Prototypes
------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------
Implementation
------------------------------------------------------------------------------*/

/*------------------------------------------------------------------------------
Name:
Purpose:
Input:
Output:
Notes:
------------------------------------------------------------------------------*/
void xmodbus(chanend tcp_svr, chanend c_user)
{
   xtcp_connection_t conn;

   modbus_tcp_reset(tcp_svr);

   // Loop forever processing TCP events
   while(1)
   {
      select
      {
      case xtcp_event(tcp_svr, conn):
         modbus_tcp_handle_event(tcp_svr, conn);
         break;
      }
   }
}

/*============================================================================*/