CLASS ltcl_fizzbuzz_mj DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      " Wenn 1 eingegeben, dann Return ( 1 , 1 )
      input_1_output_1 FOR TESTING,
      " Wenn 2 eingegeben, dann Return ( ( 1, 1 ) ( 2, 2 ) )
      input_2_output_2 FOR TESTING,
      " Wenn 3 eingegeben, dann Return ( ( 1, 1 ) ( 2, 2 ) ( 3,Fizz ) )
      input_3_output_Fizz FOR TESTING,
      input_4_output_4 FOR TESTING,
      input_5_output_5 FOR TESTING,
      input_15_output_15 FOR TESTING,
      "wenn Größe 15 dann Fehller"
      input_GR15_output_Fehler FOR TESTING.

ENDCLASS.


CLASS ltcl_fizzbuzz_mj IMPLEMENTATION.

  METHOD input_1_output_1.
    DATA lo_cut TYPE REF TO yhlind_cl_fizzbuzz_aj.

    lo_cut = NEW yhlind_cl_fizzbuzz_aj( ).

    cl_abap_unit_assert=>assert_equals( msg = 'Bei Eingabe 1 soll ( 1 , 1) ausgegeben werden'
                                        exp = VALUE z007_fizzbuzz( ( z_input = 1 z_output = '1' ) )
                                        act = lo_cut->convert( 1 ) ).
  ENDMETHOD.

  METHOD input_2_output_2.
    DATA lo_cut TYPE REF TO yhlind_cl_fizzbuzz_aj.

    lo_cut = NEW yhlind_cl_fizzbuzz_aj( ).

    cl_abap_unit_assert=>assert_equals( msg = 'Bei Eingabe 1 soll ( 1 , 1 ) ( 2, 2 ) ausgegeben werden'
                                        exp = VALUE z007_fizzbuzz( ( z_input = 1 z_output = '1' )
                                                                   ( z_input = 2 z_output = '2' ) )
                                        act = lo_cut->convert( 2 ) ).
  ENDMETHOD.

  METHOD input_3_output_fizz.
    DATA lo_cut TYPE REF TO yhlind_cl_fizzbuzz_aj.

    lo_cut = NEW yhlind_cl_fizzbuzz_aj( ).

    cl_abap_unit_assert=>assert_equals( msg = 'Bei Eingabe 1 soll ( 1 , 1 ) ( 2, 2 ) ( 3, Fizz ) ausgegeben werden'
                                        exp = VALUE z007_fizzbuzz( ( z_input = 1 z_output = '1' )
                                                                   ( z_input = 2 z_output = '2' )
                                                                   ( z_input = 3 z_output = 'Fizz' ) )
                                        act = lo_cut->convert( 3 ) ).
  ENDMETHOD.

  METHOD input_4_output_4.
*    DATA lo_cut TYPE REF TO yhlind_cl_fizzbuzz_aj.
*
*    lo_cut = NEW yhlind_cl_fizzbuzz_aj( ).
*
*    cl_abap_unit_assert=>assert_equals( msg = 'Bei Eingabe 1 soll ( 1 , 1 ) ( 2, 2 ) ( 3, Fizz ) ausgegeben werden'
*                                        exp = VALUE z007_fizzbuzz( ( z_input = 1 z_output = '1' )
*                                                                   ( z_input = 2 z_output = '2' )
*                                                                   ( z_input = 3 z_output = 'Fizz' )
*                                                                   ( z_input = 4 z_output = '4' ) )
*                                        act = lo_cut->convert( 4 ) ).
  ENDMETHOD.

  METHOD input_5_output_5.
*        DATA lo_cut TYPE REF TO yhlind_cl_fizzbuzz_aj.
*
*    lo_cut = NEW yhlind_cl_fizzbuzz_aj( ).
*
*    cl_abap_unit_assert=>assert_equals( msg = 'Bei Eingabe 1 soll ( 1 , 1 ) ( 2, 2 ) ( 3, Fizz ) ausgegeben werden'
*                                        exp = VALUE z007_fizzbuzz( ( z_input = 1 z_output = '1' )
*                                                                   ( z_input = 2 z_output = '2' )
*                                                                   ( z_input = 3 z_output = 'Fizz' )
*                                                                   ( z_input = 4 z_output = '4' )
*                                                                   ( z_input = 5 z_output = 'Buzz' ) )
*                                        act = lo_cut->convert( 5 ) ).
  ENDMETHOD.

  METHOD input_15_output_15.
*        DATA lo_cut TYPE REF TO yhlind_cl_fizzbuzz_aj.
*
*    lo_cut = NEW yhlind_cl_fizzbuzz_aj( ).
*
*    cl_abap_unit_assert=>assert_equals( msg = 'Bei Eingabe 1 soll ( 1 , 1 ) ( 2, 2 ) ( 3, Fizz ) ausgegeben werden'
*                                        exp = VALUE z007_fizzbuzz( ( z_input = 1 z_output = '1' )
*                                                                   ( z_input = 2 z_output = '2' )
*                                                                   ( z_input = 3 z_output = 'Fizz' )
*                                                                   ( z_input = 4 z_output = '4' )
*                                                                   ( z_input = 5 z_output = 'Buzz' )
*                                                                   ( z_input = 15 z_output = 'FizzBuzz' ) )
*                                        act = lo_cut->convert( 15 ) ).
  ENDMETHOD.

  METHOD input_gr15_output_fehler.
*        DATA lo_cut TYPE REF TO yhlind_cl_fizzbuzz_aj.
*
*    lo_cut = NEW yhlind_cl_fizzbuzz_aj( ).
*
**    cl_abap_unit_assert=>assert_equals( msg = 'Bei Eingabe 1 soll ( 1 , 1 ) ( 2, 2 ) ( 3, Fizz ) ausgegeben werden'
**                                        exp =
**                                        act = lo_cut->convert( 15 ) ).
  ENDMETHOD.

ENDCLASS.
