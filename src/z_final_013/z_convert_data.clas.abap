CLASS z_convert_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: float_to_decimal
      IMPORTING
        iv_float          TYPE i
      RETURNING
        VALUE(rv_decimal) TYPE decfloat34.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_convert_data IMPLEMENTATION.
  METHOD float_to_decimal.

    DATA: decimal_value TYPE decfloat34.

    decimal_value = '123.45'.
    rv_decimal = decimal_value.

    RETURN.
  ENDMETHOD.

ENDCLASS.
