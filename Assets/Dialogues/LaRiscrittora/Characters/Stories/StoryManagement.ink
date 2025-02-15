//Variabili legate alle personagge
//Con nuova versione: NotStarted non riguarda più la storia principale, ma l'accesso alla personaggia
    LIST storyStates = NotStarted, Active, Ended
    VAR minStoryQuesTCount = 7
//COME PROMEMORIA. LISTA DI TIPI DI TONO CHE POSSIAMO TENERE IN UNA CONVERSAZIONE: ROSSO (RABBIA, PASSIONE, AZIONE, OPPOSIZIONE). VIOLA (SPIRITUALITA', VISIONE DEL GRANDE SCHEMA DELLE COSE, SGUARDO POETICO, TESA VERSO UNA MISSIONE). GIALLO (GIOCOSITA', RISATA, DIVERTIMENTO, FANCIULLEZZA). VERDE (CUORE, AFFETTI, CURA DELLE PERSONE CARE, RIFLESSIONE EMOTIVA). BLU (RAZIONALITA', CALCOLO, VISIONE PRATICA, DISCIPLINA).

            /* ---------------------------------
            
               Gestione prima personaggia. 
            
             ----------------------------------*/

//Ordine degli stati: 0, Blue, Rosso, Verde, Giallo, Viola.
    LIST firstCharacterPossibleStates = Rinuncia, Triangolo, RagazzaOrchestra, FlautoDolce, Ocarina, Violino
    VAR firstCharacterState = Rinuncia
    
    VAR firstStory = NotStarted
    //Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR firstStoryQuestCount = 0
    VAR firstCharacterSpecialEvent = false
    

    //Variabili per mettere in pausa la conversazione
    VAR firstPauseTalking = 0
    VAR firstCharPauseDurantion = 3
    
    //Variabile per il countdown per la sua uscita di scena
    VAR firstCharEndingDialogue = 0
    
    //Variabile per il tempo di attesa tra una lettera e l'altra
    VAR firstWritingPause = 0
    VAR firstWritingPauseDuration = 5
    
    //STATI UP: Viola e Giallo.
    //STATI DOWN: Blu.
    VAR firstPurple = 0
    VAR firstYellow = 0
    VAR firstBlue = 0
    VAR firstGreen = 0
    VAR firstRed = 0



            /* ---------------------------------
            
               Gestione secondo personaggio. 
            
             ----------------------------------*/

//Ordine degli stati:
    LIST secondCharacterPossibleStates = LaVegliante, NuovoStatoUnoDue, NuovoStatoDueDue, NuovoStatoTreDue
    VAR secondCharacterState = LaVegliante
    
    VAR secondStory = NotStarted
    //Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR secondStoryQuestCount = 0
    VAR secondCharacterSpecialEvent = false

    //Variabili per mettere in pausa la conversazione
    VAR secondPauseTalking = 0
    VAR secondCharPauseDurantion = 4
    
    //Variabile per il countdown per la sua uscita di scena
    VAR secondCharEndingDialogue = 0    

    //Variabile per il tempo di attesa tra una lettera e l'altra
    VAR secondWritingPause = 0
    VAR secondWritingPauseDuration = 5
    
    //UP: coerenza.
    //DOWN: incoerenza, cose random
    VAR secondPurple = 0
    VAR secondYellow = 0
    VAR secondBlue = 0
    VAR secondGreen = 0
    VAR secondRed = 0    

            /* ---------------------------------
            
               Gestione terzo personaggio. 
            
             ----------------------------------*/
//Gestione terza personaggia
    LIST thirdCharacterPossibleStates = SpettroDelVuoto, LArrabbiato, IlGuarente, IlTerrorizzato, LAbbandonato, IlSocievole, IlConsapevole
    VAR thirdCharacterState = SpettroDelVuoto
    
    VAR thirdStory = NotStarted
    //Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR thirdStoryQuestCount = 0
    VAR thirdCharacterSpecialEvent = false
    
    //Variabili per mettere in pausa la conversazione
    VAR thirdPauseTalking = 0
    VAR thirdCharPauseDurantion = 4
    
    //Variabile per il countdown per la sua uscita di scena
    VAR thirdCharEndingDialogue = 0    

    //Variabile per il tempo di attesa tra una lettera e l'altra
    VAR thirdWritingPause = 0
    VAR thirdWritingPauseDuration = 5
    
    //UP: ???
    //DOWN: ???
    VAR thirdPurple = 0
    VAR thirdYellow = 0
    VAR thirdBlue = 0
    VAR thirdGreen = 0
    VAR thirdRed = 0  

















            /* ---------------------------------
            
               Gestione quarta personaggia. 
            
             ----------------------------------*/

//Gestione quarta personaggia
    LIST fourthCharacterPossibleStates = LaMondatrice, NuovoStatoUnoQuattro, NuovoStatoDueQuattro, NuovoStatoTreQuattro
    VAR fourthCharacterState = LaMondatrice
    
    VAR fourthStory = NotStarted
    VAR fourthCharacterSpecialEvent = false

            /* ---------------------------------
            
               Gestione quarta personaggia. 
            
             ----------------------------------*/
//Gestione quinta personaggia
    LIST fifthCharacterPossibleStates= IlMentore, NuovoStatoUnoCinque, NuovoStatoDueCinque, NuovoStatoTreCinque
    VAR fifthCharacterState= IlMentore
    
    VAR fifthStory = NotStarted
    //Tengo conto delle interazioni avute per aprire la possibilità di dare un dono
    VAR fifthdStoryQuestCount = 0
    VAR fifthCharacterSpecialEvent = false
    
    //Variabili per mettere in pausa la conversazione
    VAR fifthPauseTalking = 0
    VAR fifthCharPauseDurantion = 4
    
    //Variabile per il countdown per la sua uscita di scena
    VAR fifthCharEndingDialogue = 0    

    //Variabile per il tempo di attesa tra una lettera e l'altra
    VAR fifthWritingPause = 0
    VAR fifthWritingPauseDuration = 5    
    
    //STATI UP: ???
    //STATI DOWN: ???
    VAR fifthPurple = 0
    VAR fifthYellow = 0
    VAR fifthBlue = 0
    VAR fifthGreen = 0
    VAR fifthRed = 0
    



//Funzione di traduzione da variabile a stringa con articolo minuscolo
=== function lowercaseTranslator(characterState)
    {characterState:

    //Personaggia Uno
        - Rinuncia:
            ~ return "Rinuncia"
        - Triangolo:
            ~ return "Triangolo"
        - RagazzaOrchestra:
            ~ return "Ragazza Orchestra"
        - FlautoDolce:
            ~ return "Flauto Dolce"
        - Ocarina:
            ~ return "Ocarina"
        - Violino:
            ~ return "Violino"
        
    //Personaggia Due       
        - LaVegliante:
            ~ return "la Vegliante"
            
    //Personaggia Tre
        - SpettroDelVuoto:
            ~ return "il Empty"
        - IlConsapevole: 
            ~ return "il Consapevole"
        - IlGuarente: 
            ~ return "il Guarente"    
        - IlSocievole: 
            ~ return "il Socievole"
        - IlTerrorizzato: 
            ~ return "il Terrorizzato"
        - LAbbandonato: 
            ~ return "l'Abbandonato"    
        - LArrabbiato: 
            ~ return "l'Arrabbiato"

    //Personaggia Quattro             
        - LaMondatrice:
            ~ return "la Mondatrice"

    //Personaggia Cinque        
        - IlMentore:
            ~ return "il Mentore"

    }

//Funzione di traduzione da variabile a stringa con articolo maiuscolo
=== function uppercaseTranslator(characterState)
    {characterState:
    
    //Personaggia Uno
        - Rinuncia:
            ~ return "Rinuncia"
        - Triangolo:
            ~ return "Triangolo"
        - RagazzaOrchestra:
            ~ return "Ragazza Orchestra"
        - FlautoDolce:
            ~ return "Flauto Dolce"
        - Ocarina:
            ~ return "Ocarina"
        - Violino:
            ~ return "Violino"

    //Personaggia Due        
        - LaVegliante:
            ~ return "La Vegliante"

    //Personaggia Tre
        - SpettroDelVuoto:
            ~ return "Il Empty"
        - IlConsapevole: 
            ~ return "Il Consapevole"
        - IlGuarente: 
            ~ return "Il Guarente"    
        - IlSocievole: 
            ~ return "Il Socievole"
        - IlTerrorizzato: 
            ~ return "Il Terrorizzato"
        - LAbbandonato: 
            ~ return "L'Abbandonato"    
        - LArrabbiato: 
            ~ return "L'Arrabbiato"            
    
    //Personaggia Quattro        
        - LaMondatrice:
            ~ return "La Mondatrice"

    //Personaggia Cinque        
        - IlMentore:
            ~ return "Il Mentore"

    }



