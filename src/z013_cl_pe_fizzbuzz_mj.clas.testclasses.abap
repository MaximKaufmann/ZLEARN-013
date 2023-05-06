CLASS ltcl_pe_fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: mo_cut TYPE REF TO z013_cl_pe_fizzbuzz_mj.

    METHODS:
      setup,

      input_1_output_1          FOR TESTING,
      input_2_output_2          FOR TESTING,
      input_3_output_fizz       FOR TESTING,
      input_5_output_buzz       FOR TESTING,
      input_15_output_fizzbuzz  FOR TESTING.
ENDCLASS.

CLASS ltcl_pe_fizzbuzz IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW #( ).
  ENDMETHOD.

  METHOD input_1_output_1.
    cl_abap_unit_assert=>assert_equals( exp = VALUE ylhind_tt_fizzbuzz( ( user_input = 1 conv_result = CONV #( 1 ) ) )
                                        act = mo_cut->convert( 1 ) ).

  ENDMETHOD.

  METHOD input_2_output_2.
    cl_abap_unit_assert=>assert_equals( exp = VALUE ylhind_tt_fizzbuzz( ( user_input = 1 conv_result = CONV #( 1 ) )
                                                                        ( user_input = 2 conv_result = CONV #( 2 ) ) )
                                        act = mo_cut->convert( 2 ) ).
  ENDMETHOD.

  METHOD input_3_output_fizz.
    DATA(lt_result) = mo_cut->convert( 3 ).
    cl_abap_unit_assert=>assert_equals( exp = 'Fizz'
                                        act = lt_result[ 3 ]-conv_result ).
  ENDMETHOD.

  METHOD input_5_output_buzz.
    DATA(lt_result) = mo_cut->convert( 5 ).
    cl_abap_unit_assert=>assert_equals( exp = 'Buzz'
                                        act = lt_result[ 5 ]-conv_result ).
  ENDMETHOD.

  METHOD input_15_output_fizzbuzz.
    DATA(lt_result) = mo_cut->convert( 15 ).
    cl_abap_unit_assert=>assert_equals( exp = 'FizzBuzz'
                                        act = lt_result[ 15 ]-conv_result ).
  ENDMETHOD.

ENDCLASS.
