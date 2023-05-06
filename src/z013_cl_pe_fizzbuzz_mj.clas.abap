CLASS z013_cl_pe_fizzbuzz_mj DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "! Konvertiert die Eingabe zu¨:
    "!  - Input durch 3 teilbar:        Ausgabe 'Fizz'
    "!  - Input durch 5 teilbar:        Ausgabe 'Buzz'
    "!  - Input durch 3 und 5 teilbar:  Ausgabe 'FizzBuzz'
    "! @parameter iv_number | <p class="shorttext synchronized" lang="en">User Input</p>
    "! @parameter rt_result | <p class="shorttext synchronized" lang="en">Ausgabe</p>
    METHODS convert IMPORTING iv_number        TYPE int1
                    RETURNING VALUE(rt_result) TYPE ylhind_tt_fizzbuzz.
ENDCLASS.

CLASS z013_cl_pe_fizzbuzz_mj IMPLEMENTATION.

  METHOD convert.
    DATA(lv_counter) = 1.

    WHILE lv_counter <= iv_number.
      IF lv_counter MOD 15 = 0.
        APPEND VALUE ylhind_fizzbuzz( user_input = lv_counter conv_result = 'FizzBuzz' ) TO rt_result.
      ELSEIF lv_counter MOD 3 = 0.
        APPEND VALUE ylhind_fizzbuzz( user_input = lv_counter conv_result = 'Fizz' ) TO rt_result.
      ELSEIF lv_counter MOD 5 = 0.
        APPEND VALUE ylhind_fizzbuzz( user_input = lv_counter conv_result = 'Buzz' ) TO rt_result.
      ELSE.
        APPEND VALUE ylhind_fizzbuzz( user_input = lv_counter conv_result = CONV #( lv_counter ) ) TO rt_result.
      ENDIF.
      lv_counter = lv_counter + 1.
    ENDWHILE.
  ENDMETHOD.
ENDCLASS.
