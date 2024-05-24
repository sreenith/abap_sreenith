*&---------------------------------------------------------------------*
*& Report ZAI_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZAI_REPORT.


DATA: it_users TYPE TABLE OF usr02,
      wa_users TYPE usr02.

DATA: it_fieldcat TYPE slis_t_fieldcat_alv,
      wa_fieldcat TYPE slis_fieldcat_alv.

* Fetch user data from the USR02 table
SELECT * FROM usr02 INTO TABLE it_users.

* Define field catalog
wa_fieldcat-fieldname = 'BNAME'.
wa_fieldcat-seltext_m = 'User ID'.
APPEND wa_fieldcat TO it_fieldcat.

wa_fieldcat-fieldname = 'NAME_FIRST'.
wa_fieldcat-seltext_m = 'First Name'.
APPEND wa_fieldcat TO it_fieldcat.

wa_fieldcat-fieldname = 'NAME_LAST'.
wa_fieldcat-seltext_m = 'Last Name'.
APPEND wa_fieldcat TO it_fieldcat.

* Display ALV report
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_callback_program = sy-repid
    it_fieldcat        = it_fieldcat
  TABLES
    t_outtab           = it_users.
