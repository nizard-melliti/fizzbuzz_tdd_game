REPORT yr_tdd_game_r2_nmelliti.

class ltc_russian_peasant_mult definition final for testing
  duration short
  risk level harmless.

  private section.
    methods:
      setup,
      acceptance_test for testing.
endclass.


class ltc_russian_peasant_mult implementation.
  method setup.
  endmethod.

  method acceptance_test.

  endmethod.
endclass.
