=== hub_funghi ===
#background: {tag_background()}
Eccoti alle serre
    -> randomizzazione_dono_luoghi ->
    -

{
    - fungoProposto != ():
        -> cura
    - else:
        -> pre_test
    
}


=== pre_test
    {~ In questo momento, l'orto è vuoto|Non c'è nulla in crescita|Ci sei solo tu, coi tuoi pensieri}.
    + [Vuoi elaborare qualcosa di nuovo]
        -> test_coltivazioni
    + [Ti guardi attorno]
    -
    -> main

=== cura
    Ti prendi cura della serra.
    {~ L'aria sembra più dolce oggi|Da qualche parte, tra le foglie, qualcosa canta|Piccole luci sfarfallano sopra il terreno}.
    -> plant_check -> 
    + [Ti guardi attorno]
    -
    -> main
    
=== call_test
    + {contenutoFunghi has PG} [TestFunghi]
    {
    - fungoProposto != ():
        -> cura
    - else:
        -> test_coltivazioni
    
    }
    
