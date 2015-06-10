Feature: Basic Gate Loop
    In order to prevent infinite recursion in gate loops
    I need to be able to have gates detect this case

    Scenario: 
        Given that I have 2 And gates hooked up to eachother
        When I evaluate them
        Then they should evaluate correctly
