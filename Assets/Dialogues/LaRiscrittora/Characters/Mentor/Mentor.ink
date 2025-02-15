=== mentor ===
+ {are_two_entities_together(Mentor, PG)} [Mentor]
    -> speaking_with_mentor


=== speaking_with_mentor
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
-> mentor_storylets ->
    {charNameFive}: Cosa vuoi sapere {pronouns has him: amico mio|{pronouns has her: amica mia|amicə miə}}?
    - (top)
        //+ [Voglio conoscere meglio il mentore]
        + [Qualcosa non mi è chiaro.]
            -> support
        + (voices){pre_test && not voices}[Perché c'è una voce che mi racconta le cose?]
            {charNameFive}: Voce?
            {name}: Sì. Ad esempio mi descrive le cose della serra.
            {name}: O i luoghi in cui entro.
            {charNameFive}: Molto spesso chi si occupa di riscrivere la storie di altre persone ha una forte empatia.
            {charNameFive}: Vedrai che è il tuo modo di capire questo luogo.
            {charNameFive}: Un intuito latente che ora è più forte.
                -> top
        + (infoImpo){firstCharacterInkLevel has High && not infoImpo} [Cosa significa "la personaggia ti darà una informazione importante"?]
            {charNameFive}: E dove l'hai sentita questa cosa?
            {name}: Quando stavo per fare le ultime domande alla persona, {voices: la|una} voce mi ha detto "Hai tre goccie di inchiostro a disposizione. Potrai fare quattro interventi, e la personaggia ti darà una informazione importante."
            {not voices: {charNameFive}: Per la voce sarà la stanchezza, questo lavoro è faticoso.}
            {charNameFive}: Comunque non ha senso questa cosa, {name}.
                -> top
        + [Abbandono la conversazione.]
            -> main
        -
    -> top


=== support
~ temp charNameFive = uppercaseTranslator(fifthCharacterState)
    {charNameFive}: Come posso aiutarti?
    - (top)
        + {gifts_and_ink}[Mi ripeteresti cosa devo fare?]
            -> to_do
        + [Mi diresti a cosa servono i vari luoghi?]
            -> tutorial
        + [Vorrei cambiare il mio nome.]
            -> name_choice ->
        + [Vorrei cambiare i miei pronomi.]
            -> gender ->
        + [Vorrei aggiornare la lista dei miei temi delicati.]
            -> trigger_warning       
        + [Vorrei parlare d'altro.]
            -> speaking_with_mentor
        -
    -> top   


