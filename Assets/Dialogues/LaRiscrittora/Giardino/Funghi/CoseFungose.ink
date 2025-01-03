=== plant_check
{
    - fungoProposto has LicheneDegliAbissi:
    {
        - inCrescita <2: -> lichene_degli_abissi.step_zero
        - inCrescita <5: -> lichene_degli_abissi.step_uno
        - inCrescita <8: -> lichene_degli_abissi.step_due
        - inCrescita <10:
            ~ move_entity(LicheneDegliAbissi, Funghi)
            -> lichene_degli_abissi.step_tre
        - inCrescita <20: -> lichene_degli_abissi.step_quattro
    }

    - fungoProposto has MuschioDelleAmanti:
    {
        - inCrescita <2: -> muschio_delle_amanti.step_zero
        - inCrescita <5: -> muschio_delle_amanti.step_uno
        - inCrescita <8: -> muschio_delle_amanti.step_due
        - inCrescita <10:
             ~ move_entity(MuschioDelleAmanti, Funghi)
            -> muschio_delle_amanti.step_tre
        - inCrescita <20: -> muschio_delle_amanti.step_quattro
    }

    - fungoProposto has CantoDelleCompagne:
    {
        - inCrescita <2: -> canto_delle_compagne.step_zero    
        - inCrescita <5: -> canto_delle_compagne.step_uno
        - inCrescita <8: -> canto_delle_compagne.step_due
        - inCrescita <10:
             ~ move_entity(CantoDelleCompagne, Funghi)
            -> canto_delle_compagne.step_tre
        - inCrescita <20: -> canto_delle_compagne.step_quattro
    }

    - fungoProposto has LaSpazzata:
    {
        - inCrescita <2: -> la_spazzata.step_zero 
        - inCrescita <5: -> la_spazzata.step_uno
        - inCrescita <8: -> la_spazzata.step_due
        - inCrescita <10:
             ~ move_entity(LaSpazzata, Funghi)
            -> la_spazzata.step_tre
        - inCrescita <20: -> la_spazzata.step_quattro
    }

    - fungoProposto has BaccaDellaAddolorata:
    {
        - inCrescita <2: -> bacca_della_addolorata.step_zero 
        - inCrescita <5: -> bacca_della_addolorata.step_uno
        - inCrescita <8: -> bacca_della_addolorata.step_due
        - inCrescita <10:
             ~ move_entity(BaccaDellaAddolorata, Funghi)
            -> bacca_della_addolorata.step_tre
        - inCrescita <20: -> bacca_della_addolorata.step_quattro
    }

    - fungoProposto has NonTiScordarDiTe:
    {
        - inCrescita <2: -> non_ti_scordar_di_te.step_zero     
        - inCrescita <5: -> non_ti_scordar_di_te.step_uno
        - inCrescita <8: -> non_ti_scordar_di_te.step_due
        - inCrescita <10:
             ~ move_entity(NonTiScordarDiTe, Funghi)
            -> non_ti_scordar_di_te.step_tre
        - inCrescita <20: -> non_ti_scordar_di_te.step_quattro
    }

    - fungoProposto has BrinaDellImpossibile:
    {
        - inCrescita <2: -> brina_dell_impossibile.step_zero     
        - inCrescita <5: -> brina_dell_impossibile.step_uno
        - inCrescita <8: -> brina_dell_impossibile.step_due
        - inCrescita <10:
             ~ move_entity(BrinaDellImpossibile, Funghi)
            -> brina_dell_impossibile.step_tre
        - inCrescita <20: -> brina_dell_impossibile.step_quattro
    }    
    ->->
}


=== lichene_degli_abissi
//Collaborazione, ciclicità, cancellazione
//Outcome: allontana qualcuno.
    = step_zero
        <i>Una punticina bluastra emerge dal terreno.</i>
        -> main
    
    = step_uno
        <i>Un odore salmastro si diffonde per la serra.</i>
        <i>Ora la punta è più grande, e attorno c'è un foro circolare.</i>
          -> main
          
    = step_due
        <i>Il foro ha le dimensioni di un pugno, mentre la punta sembra roteare nell'aria a incredibile velocità, completamente silenziosa.</i>
          -> main
          
    = step_tre
    + {are_two_entities_together(LicheneDegliAbissi, PG)} [LicheneDegliAbissi]
        <i>Eccolo qui. Un <b>Lichene degli abissi</b></i>
        Il lichene degli abissi è una danza, un roteare costante di fungo ed alga. Un ripetersi anche nell'errore, nel dolore.
        Alga e fungo girano e rigirano senza mai afferrarsi.
        Se qualcuno sfiora il lichene, questo è destinato a scomparire.</i>
            
            + + [Tocco il lichene]
                <i> Un piccolo sbuffo. Le tue dita ora sanno di mare.
                Il lichene è scomparso, tu no.
                C'è qualcuno che devi allontanare?</i>
                    ~ move_entity(LicheneDegliAbissi, CasettaAnime)
                    ~ inCrescita = 0
                    ~ fungoProposto = ()
            + + [Lo lascio dov'è]
            - -
              -> main
              
    = step_quattro
        <i>Troppo tempo è passato, e non rimane che un foro nel terreno.</i>
            ~ move_entity(LicheneDegliAbissi, CasettaAnime)
            ~ inCrescita = 0
            ~ fungoProposto = ()
              -> main

=== muschio_delle_amanti
//Collaborazione, novità, ricordo
//Outcome: datti piacere
    = step_zero
        <i>È solo una tua impressione, o i rami hanno iniziato a brillare?</i>
        -> main
    
    = step_uno
        <i>C'è una polvere ramata, brillante, che scende da alcuni rami.</i>
          -> main
          
    = step_due
        <i>La polvere si è intrecciata, arrotolata, come a formare dei fili.</i>
          -> main
    
    = step_tre
    + {are_two_entities_together(MuschioDelleAmanti, PG)} [MuschioDelleAmanti]
        <i>Senti un fremito nel ventre. I rami ora sono coperti da un fitto tappeto del color dell'alba.
        Quando lo sfiori le tue labbra tremano, ricordi ti invadono: quel bacio, quelle dita desiderate tra le coscie.
        Pienezza ti riempie: è per forza del <b>Muschio delle amanti</b>
        Potresti portarne un po' con te, sapendo che sparirà.</i>
        O lasciarlo qui sull'albero.
            
            + + [Raccolgo un po' del muschio]
                Così vicino, il muschio ti chiama.
                Ti invita a fermare per un attimo tutto, a premiare come più ti piace il tuo corpo, dentro o fuori che sia.
                    ~ move_entity(MuschioDelleAmanti, CasettaAnime)
                    ~ inCrescita = 0
                    ~ fungoProposto = ()
                    {
                        - doniTrovati hasnt MuschioDelleAmanti:
                        ~ doniTrovati += MuschioDelleAmanti
                    }
            + + [Non è ancora il momento]
            - -
             -> main
    
    = step_quattro
        <i>Qualcosa ti titilla lo stomaco, ma qualunque cosa stesse crescendo, non c'è più.</i>
                ~ move_entity(MuschioDelleAmanti, CasettaAnime)
                ~ inCrescita = 0
                ~ fungoProposto = ()
            -> main

=== canto_delle_compagne
//Collaborazione, ciclicità, ricordo
//Outcome: canta, sola o con le compagne
    = step_zero
        <i>Qualcosa vibra e ti sveglia le gambe.
        Hai voglia di danzare.</i>
        -> main
        
    = step_uno
        <i>Piccole palline rosse sul terreno caldo.
        L'umidità evapora creando una nebbiolina rossastra.</i>
          -> main
          
    = step_due
        <i>Le palline ondeggiano nella nebbia ora, sospinte da un vento invisibile.
        Si rincorrono e si tuffano sul terreno, facendo come un suono di risata.</i>
          -> main
          
    = step_tre
    + {are_two_entities_together(CantoDelleCompagne, PG)} [CantoDelleCompagne]
        <i>La serra tutta si è fatta rossa, uno stupendo <b>Canto delle compagne</b> galleggia sul terreno</i>
        In un altro tempo, più pauroso, questo fungo veniva chiamato
        "Canto delle streghe".
        L'euforia ti riempie i polmoni, senti la gioia di sapere che non sei mai stata davvero sola.
        Hai voglia di cantare.
        Questo spingerà il fungo altrove, verso altre streghe, altre compagne.</i>
        
        + + [È il momento di cantare]
                <i>Puoi farlo da te, o chiamare qualcuno a cui tieni.
                Riempiti dell'euforia del fungo, e lascia che il mondo intero ascolti la tua voce.
                Con l'ultima nota, il fungo sarà altrove, da un'altra compagna bisognosa.</i>
                    ~ move_entity(CantoDelleCompagne, CasettaAnime)
                    ~ inCrescita = 0
                    ~ fungoProposto = ()
                    -> main
        + + [No, non ora]
              -> main
              
    = step_quattro
        <i>Rimane un coro lontano dell'aria, nulla di più.</i>
            ~ move_entity(CantoDelleCompagne, CasettaAnime)
            ~ inCrescita = 0
            ~ fungoProposto = ()
            -> main

=== la_spazzata
//Indipendenza, novità, cancellazione
//Outcome: prometti di dire qualcosa che ti pesa sullo stomaco.
    = step_zero
        <i>Uh. Non vedi nulla. Forse qualcosa è andato storto?</i>
            -> main
         
    = step_uno
         <i>La serra è vuota, eppure qualcosa è cambiato.</i>
            -> main
    
    = step_due
        <i>Le luci sono più tenui.
        Il soffitto di rami sfiora la tua testa.</i>
            -> main
    
    = step_tre
    + {are_two_entities_together(LaSpazzata, PG)} [LaSpazzata]
        <i>Tutto scricchiola, gli alberi sembrano gemere dal dolore.
        Il terreno stesso è impacciato, crepato.
        Ora riconosci cosa hai piantato: una grossa, esplosiva <b>Spazzata</b>
        La Spazzata non è un fungo, non è una pianta, ma è un insieme di tutte queste cose.
        E se non viene fatta sfogare, esploderà spazzando via tutta la serra.</i>
        
        + + [Bene: facciamola sfogare!]
            <i>Questa è la parte più facile: basta prometterle che dirai a qualcuno qualcosa che senti sullo stomaco. Qualcosa che sono giorni o settimane (uh: questa Spazzata è molto grande. forse mesi?) che ti pesa.
                Falle la promessa, e se ne andrà.
                Ma se poi tradisci la promessa, la Spazzata tornerà ancora più forte.</i>
                    ~ move_entity(LaSpazzata, CasettaAnime)
                    ~ inCrescita = 0
                    ~ fungoProposto = ()
                    -> main
        + + [Non ora]
            -> main
    
    = step_quattro
        <i>Il soffitto di rami sembra incavato. Ciò che c'era, ora non è più.</i>
            ~ move_entity(LaSpazzata, CasettaAnime)
            ~ inCrescita = 0
            ~ fungoProposto = ()    
          -> main


=== bacca_della_addolorata
//Indipendenza, novità, cancellazione
//Outcome: liberazione, invito ad avanzare
    = step_zero
        <i>Cinque punte scure emergono dal terreno.</i>
            -> main
    
    = step_uno
        <i>Una mano rugosa stritola il terreno, le sue dita sembrano arrivare a infinita profondità.</i>
            -> main
    
    = step_due
        <i>Dalla troncatura della mano emergono piccoli rami ricolmi di fiorellini bianchi. Ogni volta che espiri, un fiorellino vola via.</i>
          -> main
          
    = step_tre
    + {are_two_entities_together(BaccaDellaAddolorata, PG)} [BaccaDellaAddolorata]
        <i>Nè rami, nè fiori. Solo la mano, e una piccolissima bacca vermiglia.
        <i>Hai trovato una <b>Bacca dell'addolorata</b></i>
        <i>Una pianta cara a chi ha finalmente trovato la sua strada, ma non riesce ad avanzare</i>
        <i>La sua bacca aiuta a capire cosa ci vincola, cosa non ci lascia allontanare.</i>
            
            + + [La afferro]
            <i>La mano molla la sua presa, rivelandosi per quel che era dall'inizio: solo un insieme tenace di radici.
            Senti dalle tue spalle qualcosa sciogliersi, scivolare via: ora hai un po' meno paura di camminare.</i>
                ~ move_entity(BaccaDellaAddolorata, CasettaAnime)
                ~ inCrescita = 0
                ~ fungoProposto = ()
                    {
                        - doniTrovati hasnt BaccaDellaAddolorata:
                        ~ doniTrovati += BaccaDellaAddolorata
                    }
            
                -> main
            + + [Non è il momento]
                -> main
              
    = step_quattro
        <i>Una mano tremante nel terreno, rinsecchita. Si sbriciola al primo soffio d'aria.</i>
            ~ move_entity(BaccaDellaAddolorata, CasettaAnime)
            ~ inCrescita = 0
            ~ fungoProposto = ()
            -> main

=== non_ti_scordar_di_te
//Indipendenza, ciclicità, ricordo
//Outcome: ricordo di chi non c'è più
    = step_zero
        <i>Su uno dei tronchi a terra è comparsa una sostanza viscosa, gelatinosa.</i>
            -> main
    
    = step_uno
        <i>La sostanza si è espansa.
        Non è invitante al tatto, ma l'aria attorno ti ricorda qualcosa: sigaro, tabacco forse?
        O è canfora? O addirittura torta, o rabarbaro, o caffè.
        Qualunque cosa sia, ti piace.</i>
          -> main
          
    = step_due
        <i>La sostanza si è solidificata, e nel farlo il tronco è in più punti sparito.
        No, non sparito: è trasparente.
        Fili di vetro sembrano puntare verso il cielo.</i>
          -> main
          
    = step_tre
    + {are_two_entities_together(NonTiScordarDiTe, PG)} [NonTiScordarDiTe]
        <i>Tronco e sostanza sono una cosa sola: un fungo di vetro, dita che si sfiorano e intrecciano lanciate verso il cielo.
        Hai trovato un <i><b>Non ti scordar di te</b></i>
        Cresce su ciò che è passato, che non c'è più, per renderlo parte di sè.
        Qualcosa di nuovo, eppure antico.
        Quando sfiorisce, il ciclo ricomincia.</i>
        
        + + [Intreccio le tue dita alle sue]
            <i>Si sciolgono tra le tue mani, rilasciando di nuovo un profumo familiare.
            Ti porti quel che rimane alle labbra: il tuo corpo viene invaso da fiducia e calore.
            Senti in te chi non c'è più: siete parte della stessa storia.</i>
                ~ move_entity(NonTiScordarDiTe, CasettaAnime)
                ~ inCrescita = 0
                ~ fungoProposto = ()
              -> main
        + + [Non ora]
              -> main
              
    = step_quattro
        <i>Malinconia. La sensazione di aver fatto tardi, di aver perso qualcosa di importante.</i>
            ~ move_entity(NonTiScordarDiTe, CasettaAnime)
            ~ inCrescita = 0
            ~ fungoProposto = ()
        -> main
        

=== brina_dell_impossibile
//Ricordo, collaborazione, novità
//Outcome: prova una strada nuova
    = step_zero
        <i>Le vetrate della serra sembrano più opache</i>
            -> main
    
    = step_uno
        <i>Al centro di una delle vetrare è comparso quello che sembra un foro</i>
          -> main
          
    = step_due
        <i>Il foro si è trasformato in un reticolato irregolare</i>
          -> main
    
    = step_tre
    + {are_two_entities_together(BrinaDellImpossibile, PG)} [BrinaDellImpossibile]
        <i>Isole di vetro galleggiano nell'aria</i>
        <i>La vetrata dovrebbe crollare, sparire, svanire ma invece resta dov'è, e se la spingi non si sposta</i>
        <i>Eppure api e petali attraversano il reticolato</i>
        <i>E quando provi a infilarci un dito, un ricordo imprevisto: sai che questa cosa si chiama <b>Brina dell'Impossibile</b></i>
        <i>Sai che puoi raccoglierla, anche se non sai cosa accadrà</i>
        
        + + [Infilo la mano tra quegli spazi vuoti]
            <i>Il vetro si rinsalda, spingendo via la tua mano</i>
            <i>Le linee del tuo palmo si fanno trasparenti, inconsistenti. Eppure puoi muovere le dita, e non provi alcun dolore</i>
            <i>Non tutti i cambiamenti sono così facili, ma ora hai la certezza che puoi provare quella cosa che rimandi da sempre: la paura di trovarti a pezzi è solo quello: paura</i>
                ~ move_entity(BrinaDellImpossibile, CasettaAnime)
                ~ inCrescita = 0
                ~ fungoProposto = ()
                    {
                        - doniTrovati hasnt BrinaDellImpossibile:
                        ~ doniTrovati += BrinaDellImpossibile
                    }                
              -> main
        + + [Ho bisogno di pensarci un poco]
              -> main
              
    = step_quattro
        <i>Non noti nulla di strano. Qualcosa è cambiato, senza che te ne accorgessi</i>
            ~ move_entity(BrinaDellImpossibile, CasettaAnime)
            ~ inCrescita = 0
            ~ fungoProposto = ()

                        
        -> main      
          

-> main