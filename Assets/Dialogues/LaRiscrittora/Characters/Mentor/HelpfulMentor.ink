/* ---------------------------------

   Presentazioni

 ----------------------------------*/

=== welcome ===
~ temp charName = uppercaseTranslator(fifthCharacterState)
    Sconosciuto: Che buffo, è da un po' che non incontravo una persona nuova.
    Sconosciuto: Immagino tu abbia un milione di domande, vero?
    - (top)
        * (dove) [Dove sono?]
            {chiSei:{charName}|Sconosciuto}: Questa è una risposta che potrai trovare solo col tempo.
            {chiSei:{charName}|Sconosciuto}: La cosa che posso dirti con certezza però è che un posto sicuro.
            {chiSei:{charName}|Sconosciuto}: Un posto dove prenderti le cose coi tuoi tempi, direi.
            {chiSei:{charName}|Sconosciuto}: Che non è poi male, no?
            {chiSei:{charName}|Sconosciuto}: So che fuori da qui è tutto un vortice continuo di casini.
                -> top
        
        * (chiSei) [Chi sei?]
            Sconosciuto: Dipende molto dal momento, e dalla persona che ho davanti.
            Sconosciuto: Ma direi che puoi chiamarmi <b>{lowercaseTranslator(fifthCharacterState)}</b>.
            {charName}: Non un nome originale ma ehi, almeno ti ricordi chi chiamare se sei in difficoltà, no?
                -> top
        
        * (vado) [Come me ne vado da qui?]
            {chiSei:{charName}|Sconosciuto}: Dipende.
            {chiSei:{charName}|Sconosciuto}: Se con "qui" intendi questa conversazione, di solito interrompere la conversazione è sempre possibile.
            {chiSei:{charName}|Sconosciuto}: Basta dire qualcosa tipo "me ne vado" o simili.
            {chiSei:{charName}|Sconosciuto}: Nei casi più estremi c'è chi dice "quit", che credo sia il verso di un uccellino.
            {chiSei:{charName}|Sconosciuto}: Spesso tornano comunque, e la cosa mi fa piacere.
            {chiSei:{charName}|Sconosciuto}: Per il resto: se sei qui è perché in qualche modo l'hai chiesto.
            {chiSei:{charName}|Sconosciuto}: Forse ancora non lo sapevi, ma non è un problema: Presto o tardi capirai il perché direi.
                -> top
        * {vado} [Me ne vado.]
            {chiSei:{charName}|Sconosciuto}: Giusto un secondo, persona nuova.
            -> your_name
        * {vado or chiSei or dove} [Perfetto: ma ora?]
            -> your_name
        * -> your_name
    
    = your_name
        ~ temp charName = uppercaseTranslator(fifthCharacterState)
        
        {chiSei:{charName}|Sconosciuto}: Ora tocca a me farti una domanda: come ti devo chiamare?
        {chiSei:{charName}|Sconosciuto}: Puoi usare qualsiasi nome: prendi questa occasione come un nuovo inizio.
            -> name_choice ->
        {chiSei:{charName}|Sconosciuto}: E quali sono i pronomi in cui ti riconosci?
            -> gender ->
        {chiSei:{charName}|Sconosciuto}: Piacere di conoscerti, {name}.
        {chiSei:{charName}|Sconosciuto}: E {pronouns has him: benvenuto|{pronouns has her: benvenuta|benvenutə}}. Spero ti troverai bene, qui.
        {not chiSei: Sconosciuto: Ah, che sbadato. Invece tu chiamami <b>{charName}</b>.|{charName}: È il mio dovere farvi stare bene.}
        {charName}: Un'altra cosa importante, {name}.
        {charName}: Nel tuo soggiorno in questo luogo potrebbe accadere che incontrerai qualche situazione complessa.
        {charName}: Se ti va di dirmi quali sono le cose che ti creano disagio, farò del mio meglio per non fartele incontrare.
                -> trigger_warning ->
        {charName}: Ma in tutto questo non ti ho detto cosa devi fare!
            
            {
                - not talk_with_first_character: 
                    {charName}: Facciamo così: prova a parlare con la persona che troverai alla <b>fermata del bus</b>.
                    {charName}: E poi torna da me.
                         ~ firstPauseTalking = 0
                            ->->
                - talk_with_first_character:
                    {charName}: Sembra che quella persona ti abbia raccontato qualcosa di sè!
                            -> gifts_and_ink
    
            }

            
    === gifts_and_ink
    ~ temp charName = uppercaseTranslator(fifthCharacterState)
    ~ temp charNameUno = uppercaseTranslator
    
        {charName}: Ogni tanto capita che delle persone si ritrovino in questo posto.
        {charName}: Sono sempre persone che sono rimaste bloccate in qualcosa.
        {charName}: Spesso sono storie di rimpianto o rimorso, in alcuni casi di traumi, o sensi di colpa.
        {charName}: Ma quale che sia il motivo, non riescono più ad andare avanti con la loro vita.        
        {charName}: In tutte queste situazioni arrivi tu, {name}.
        {charName}: Cerca di ascoltarle, di capirle, di intuire come ragionano.
        {charName}: Conquista la loro fiducia, e quando saranno aperte con te, ti verrà offerta l'occasione di dare loro un </b>dono<b>.
        {
            - knowing_first_character.one.oneYellow:
            {charName}: E credo che parlare con {charNameUno} dei violini e dei tamburi sia stato un ottimo inizio.
            
            - knowing_first_character.one.oneRed:
            {charName}: L'idea di {charNameUno} per esempio è stata originale, indubbiamente, ma non l'ho percepita particolarmente entusiasta all'idea.
            
            - knowing_first_character.one.oneBlue:
            {charName}: Anche se ho visto che hai risposto a {charNameUno} in modo molto razionale. Non la cosa che preferisce.
            
            - knowing_first_character.one.oneGreen:
            {charName}: La tua proposta di ascoltare {charNameUno} per esempio è stata molto tenera, ma non sono sicura che sia molto nelle sue corde.
            
            - knowing_first_character.one.onePurple:
            {charName}: Ho l'impressione che dire a {charNameUno} che Talco sarà sempre con lei abbia fatto partire le cose col piede giusto.
        
        }
        {charName}: I doni sono oggetti che a volte troverai in questo luogo, ma che il più delle volte creerai da te.
        {charName}: Ad esempio, coltivando qualcosa <b>alla serra</b>.
        {charName}: Il dono è una cosa importante, perché è il tuo modo di dimostrare loro che l3 hai ascoltat3.

            + [Matematico: ascolto, analizzo, scelgo il dono.]
                {charName}: Magari non proprio <i>matematico</i>.
                {charName}: Piuttosto, direi empatico.
                    ~ fifthBlue ++
            + [Come un videogioco: comprendi il loop, dai il meglio di te.]
                {charName}: Sì.
                {charName}: Anche se le persone non sono un loop.
                {charName}: E tu non devi dare il meglio, ma quello che sei.
                    ~ fifthYellow ++
            + [Mi stai chiedendo di lavorare senza darmi un soldo.]
                {charName}: Non è un lavoro.
                {charName}: E qui non c'è denaro.
                {charName}: E non sono un tuo nemico: non serve questo atteggiamento aggressivo.
                    ~ fifthRed ++
            + [Quindi devo creare una relazione con queste persone?]
                {charName}: Sì, secondo i tuoi bisogni e i tuoi limiti ovviamente.
                {charName}: Non serve a nessuno che tu ti annulli per aiutare chi hai davanti.
                    ~ fifthGreen ++
            + [La fiducia non si conquista, la fiducia è un dono.]
                {charName}: Esatto.
                {charName}: E quindi puoi vedere tutto questo come uno scambio.
                    ~ fifthPurple ++
            -
        {charName}: Ora, perché devi dare un dono?
        {charName}: Non solo per dimostrare a queste persone che le hai ascoltate, ma anche per aumentare la tua quantità di <b>inchiostro</b>.
        {charName}: Perché tu {pronouns has him: amico mio|{pronouns has her: amica mia|amicə miə}} sei <b>{pronouns has him: un riscrittore|{pronouns has her: una riscrittora|unə riscrittorə}}</b>!
        {charName}: Aiuti queste persone bloccate a guardare la loro storia in modo diverso, e a scegliersi un nuovo nome.
        
            + [E tu, hai bisogno di un nuovo nome?]
                {charName}: Io?
                {charName}: No!
                {charName}: Questo è sempre stato il mio nome.
                {charName}: Ed è la cosa che amo più fare.
                    ~ fifthPurple ++
                    
            + [Con l'inchiostro ci posso disegnare?]
                {charName}: No, {name}.
                {charName}: Tu sei {pronouns has him: un riscrittore|{pronouns has her: una riscrittora|unə riscrittorə}}, non {pronouns has him: un disegnatore|{pronouns has her: una disegnatrice|unə disegnatricə}}
                    ~ fifthYellow ++
            + [Servono le persone care per guardarsi in modo diverso.]
                {charName}: A volte è più facile aprirsi a chi non si conosce.
                {charName}: E mentre noi riflettiamo sulle loro difficoltà, impariamo anche qualcosa su di noi.
                {charName}: E poi... no, questo te lo dirò tra qualche tempo.
                        ~ fifthGreen ++
                        
            + [Tipo gaslighting?]
                {charName}: No no no assolutamente no.
                {charName}: Anche perché se una persona si sente presa in giro, sarà tutto fuorché disponibile a fidarsi di te.
                        ~ fifthRed ++
            
            + [Un nome è un nome. Che se ne fanno di uno nuovo?]
                {charName}: Un nome è come una magia.
                {charName}: Lo carichiamo di volta in volta di significato.
                {charName}: E quando lo usiamo, ci dice chi siamo.
                {charName}: A volte quella magia non va più bene, e dobbiamo cercare una nuova formula. Un nuovo nome.
                    ~ fifthBlue ++
            -
        

            {charName}: Quindi: quando avrai conquistato la fiducia di quella persona e le avrai donato qualcosa, torna da me per le ultime istruzioni.
            ~ firstPauseTalking = 0
            -> main
             

    
    === questions
    ~ temp charName = uppercaseTranslator(fifthCharacterState)
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    
        {firstCharacterInkLevel == Empty or firstCharacterInkLevel == Low: {charName}: Non ti demoralizzare, capita a chiunque di non dare il massimo al primo colpo.}
        {firstCharacterInkLevel == Normal: {charName}: Bel colpo! Ti sei {pronouns has him: guadagnato|{pronouns has her: guadagnata|guadagnatə}} subito una bella dose di inchiostro!}
        {firstCharacterInkLevel == High: {charName}: Beh, hai dato alla persona il suo dono preferito! Sei già {pronouns has him: pronto|{pronouns has her: pronta|prontə}} per questo incarico!}
        {charName}: Ora: a cosa serve l'inchiostro?
        {charName}: Sostanzialmente più alto è il valore di inchiostro, più <b>interventi</b> puoi fare.
        {charName}: Un intervento ti è sempre garantito, per provare a cambiare le cose, ma gli altri te li devi meritare.
        {charName}: Gli interventi sono domande o commenti che puoi fare su cose diverse che preoccupano la persona.
        {charName}: Più interventi hai a disposizione, più puoi convincere la persona a vedere le cose diversamente.
        {charName}: A raggiungere il tuo obiettivo:
        {charName}: riscrivere la sua storia.
        
            + [Hai un consiglio da darmi, Mentore?]
                {charName}: Sii chi sei.
                {charName}: Non essere altro.
                {charName}: Non chiedere alla persona di essere altro.
                {charName}: La stai aiutando a trovare chi è, non un'altra persona diversa da sé.
                    ~ fifthGreen ++
                    
            + [Ma non posso dirle: chiamati così, ciao, adios!?]
                {charName}: Un nuovo nome è una nuova esperienza.
                {charName}: E l'esperienza viene dal percorso.
                {charName}: Se non c'è percorso, non c'è cambiamento.
                    ~ fifthRed ++
            
            + [Non è una persona razionale. Può farcela?]
                {charName}: {name}, capisco la tua perplessità, ma sì, ce la può fare.
                    ~ fifthBlue ++
                    
            + [Gli scoiattoli non hanno bisogno di riscriverla, invece?]
                {charName}: Gli scoiattoli non hanno intelletto.
                {charName}: Non si fanno queste domande.
                {charName}: Gli scoiattoli <i>sono</i> e basta.
                    ~ fifthYellow ++
                    
            + [Mentore, ti stimo, ma non sei tu a decidere il mio obiettivo.]
                {charName}: Il tuo obiettivo <i>qui</i>, perdonami.
                {charName}: Non avendo altri luoghi in cui andare, mi dimentico che possono esserci sono altre vite, altri obiettivi da raggiungere.
                    ~ fifthPurple ++
            -
        {charName}: Ricorda {name}: sei una guida, ma sta alla persona decidere alla fine chi è, e di cosa ha bisogno.
        {charName}: Quando te la senti, affronta questo ultimo passaggio, e poi torna da me.
                ~ firstPauseTalking = 0
                    -> main
        
        
    === first_character_feedback
    ~ temp charName = uppercaseTranslator(fifthCharacterState)
    ~ temp charNameUno = uppercaseTranslator(firstCharacterState)
    
        {charName}: Beh, direi che è andata, {name}.
        TODO: quando la voce è definita, qui ci "giudica".
        {
            - firstCharacterPossibleStates has Triangolo:
                {charName}: Hai aiutato {charNameUno} a riscoprire il suo lato più pratico, razionale.
            - firstCharacterPossibleStates has RagazzaOrchestra:
                {charName}: {charNameUno} ora sa di possedere un'idole più attiva, e anche oppositiva se serve.
            - firstCharacterPossibleStates has FlautoDolce:
                {charName}: Grazie al tuo lavoro, {charNameUno} ha scoperto che gli affetti sono la cosa per lei fondamentale.
            - firstCharacterPossibleStates has Ocarina:
                {charName}: {charNameUno} ha trovato nella giocosità uno sblocco, ed è pronta ad abbandonarsi alla sua creatività,
            - firstCharacterPossibleStates has Violino:
                {charName}: {charNameUno} aveva bisogno di riconoscere che per lei la vita ha senso solo con uno scopo più grande, e grazie a te, ce l'ha fatta.
            - else: {charName}: Non tutte le persone sono disposte a cambiare, ma questa non è una tua colpa. 
        }
        
        {charName}: Non ti conosco ancora abbastanza, ma ci tengo a dirtelo: sentiti {pronouns has him: soddisfatto|{pronouns has her: soddisfatta|soddisfattə}}!
        {charName}: Questo è un lavoro complesso, ma vedrai che col tempo sarà tutto più facile.
        {charName}: E per ogni momento di confusione o incertezza, ricordati che potrai chiedermi qualsiasi cosa.
            -> main
       

/* ---------------------------------

   Tutorial

 ----------------------------------*/


=== tutorial
~ temp charName = uppercaseTranslator(fifthCharacterState)
//Strutturare come wave sintetica?
    {charName}: Ecco i luoghi che puoi visitare in questo momento.
    {charName}: Su quali vorresti avere un po' di informazioni?
-(top)
    + [Sulla fermata del bus.]
            {charName}: La fermata, ad est del Giardino, è il posto dove approdano le nuove persone.
            {charName}: È anche il luogo attraverso cui potrai raggiungerci.
            {charName}: O da cui andartene, quando vorrai.
                -> top

    + [Sulla serra.]
            {charName}: La serra è un piccolo posto di meditazione.
            {charName}: Se non sta crescendo nulla, puoi provare a seguire le sue suggestioni.
            {charName}: Col tempo qualcosa crescerà, e a quel punto forse avrai anche una risposta a una domanda che non sapevi di doverti fare.
                -> top

    + [Sulla foresta.]
            {charName}: La foresta è un po' il nostro posto di passaggio.
            {charName}: Non ho idea di chi abbia messo la panchina, sinceramente.
            {charName}: E quella pianta, fungo, cosa che è nel mezzo, non ho ancora capito come farla rifiorire.
            -> top
    
    + {secondTier}[Sulla Library.]
        Informazioni
            -> top
            
    + {thirdTier}[Sulle Laboratory.]
        Informazioni
            -> top

    + {fourthTier}[Sul nest.]
        Informazioni
            -> top

    + [Vorrei parlare di qualcosa di diverso.]
        -> speaking_with_mentor
    -

    -> speaking_with_mentor

=== to_do
~ temp charName = uppercaseTranslator(fifthCharacterState)

        {gifts_and_ink}{charName}: Step uno: <b>parli</b> con la persona, cerchi di capire di cosa ha bisogno, come ragiona, e conquisti la sua fiducia.
        {gifts_and_ink}{charName}: Step due: le fai un <b>dono</b>.
        {gifts_and_ink}{charName}: Più il dono è qualcosa di gradito, più avrai <b>inchiostro</b> per aiutarla a riscrivere la sua storia.
        {questions}{charName}: Step tre: inizi i tuoi <b>interventi</b>, riprendendo eventi della sua storia e la aiuti a guardarli sotto una luce diversa.
        {questions}{charName}: Step quattro: la persona sceglierà il suo <b>nuovo nome</b>.
        {questions}{charName}: Step cinque: ti <b>riposi</b>.
           -> speaking_with_mentor



/* ---------------------------------

   Trigger Warning
       
//Variabili per tracciare i trigger warning
VAR alcoholism = false
VAR abuses = false
VAR mourning = false

 ----------------------------------*/
 
 === trigger_warning ===
 ~ temp charName = uppercaseTranslator(fifthCharacterState)
 
    {charName}: Questi sono i principali temi delicati che potresti incontrare durante le tue chiacchierate.
    {charName}: Riuscirò per la maggior parte dei casi a fare in modo che tu non ne venga mai in contatto se li disabiliti.
    {charName}: E sono consapevole che ne mancano diversi, ma qui è un lavoro complicato, sono l'unico mentore, ma sono sempre pronto ad accogliere ogni segnalazione.

    - (top)
    {charName}: Cosa vorresti evitare?
    + {alcoholism == true}[Preferirei non leggere nulla che riguardi la dipendenza da alcool.]
        {charName}: Capisco benissimo. Preferenza registrata.
        ~ alcoholism = false
            -> top
    + {alcoholism == false}[Ho cambiato idea: introducimi pure storie che parlano di dipendenza d'alcool.]
        {charName}: Ottimo. Preferenza registrata.
        ~ alcoholism = true
            -> top
        
  
    + {abuses == true}[Non voglio leggere storie su relazioni abusanti.]
        {charName}: Hai il mio appoggio. Preferenza registrata.
        ~ abuses = false
            -> top
    + {abuses == false}[Sai, forse mi va bene di affrontare storie che parlano di abuses relazionali.]
        {charName}: Perfetto. Preferenza registrata.
        ~ abuses = true
            -> top

    + {mourning == true} [Non me la sento di parlare di lutto.]
        {charName}: Sentiti a casa. Preferenza registrata.
        ~ mourning = false
            //Rimuovo coltivabile legato a lutto
            ~ pianteCiclicità -= NonTiScordarDiTe
            ~ pianteIndipendenza -= NonTiScordarDiTe
            ~ pianteRicordo -= NonTiScordarDiTe
            ~ backupCultivable -= NonTiScordarDiTe
            -> top
    + {mourning == false} [Ho cambiato idea: me la sento di parlare di lutto.]
        {charName}: Grandioso. Preferenza registrata.
        ~ mourning = true
        
            -> top
        
    + {loneliness == true} [Preferirei evitare storie di solitudine e abbandono.]
        {charName}: Preferenza registrata. E se butta male, sono qui.
        ~ loneliness = false
            -> top
    + {loneliness == false} [Sono {pronouns has him: pronto|{pronouns has her: pronta|prontə}} ad ascoltare storie di solitudine e abbandono.]
        {charName}: Preferenza registrata. E se butta male, puoi sempre cambiare idea.
        ~ loneliness = true
            -> top
            
    + [Sono a posto così.]
        ->->
    -  
 -> main