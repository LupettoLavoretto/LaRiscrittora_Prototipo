using Ink.Runtime;
using UnityEngine;
using TMPro;
using System.Collections.Generic;
using System.Collections;
using UnityEngine.EventSystems;
using Microsoft.Unity.VisualStudio.Editor;


public class DialogueManagerSingleInk : MonoBehaviour
{
    //Field è la variabile all'interno di una classe

    [Header("Dialogue UI")]
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;
    private Story story;

    [Header("Text elements")]
    [SerializeField] private TextAsset inkAssetJSON;
    [SerializeField] private GameObject[] entities;

    [Header("Choices UI")]
    [SerializeField] private GameObject[] choices;
    private TextMeshProUGUI[] choicesText;

    [Header("Background")]
    //prova per cambiare il background//
    private const string BACKGROUND_TAG = "background";
    [SerializeField] private Image background;
    private Sprite newSprite;




    void Start()
    {
        story = new Story(inkAssetJSON.text);
        ContinueStory();

        dialoguePanel.SetActive(false);

        //Elemento aggiunto dopo l'ultima "lezione" di Mattia
        //Con l'opzione qui sotto facciamo in modo che il testo nelle scelte coincida con la quantità di opzioni di scelta presenti nell'array. Prima definiamo la lunghezza dell'array dei GameObject "choices". Da lì aggiungiamo un bottone alla volta.
        //Questa roba forse l'ho capita fino a un certo punto: perché uso GetComponent e non SetActive?
        choicesText = new TextMeshProUGUI[choices.Length];
        int index = 0;
            foreach (GameObject choice in choices)
            {
                choicesText[index] = choice.GetComponentInChildren<TextMeshProUGUI>();
                index++;
            }

        //GetComponent<Image>();    
    }

    void Update()
    {
        //Se non ci sono conversazioni in corso, skippiamo (return)
        // if(!dialogueIsPlaying)
        //    return;
        //}

        //Se invece il dialogo è in corso, ci interessa sapere se il giocatore preme il tasto di interazione per mandare avanti la conversazione
        // if (InputManager.GetInstance().GetSubmitPressed())
        // {
        //     ContinueStory();
        // }
    }

    void ContinueStory()
    {
        //se la storia può continuare, falla continuare.
        //esamina la riga corrente.
        //se è un interact, dobbiamo fare qualcosa di speciale.
        if (story.canContinue)
        {
            //Vado alla prossima riga di testo
            //Creo una variabile string a cui assegno il valore della riga corrente di ink
            //Devo leggere il codice qui sotto al contrario: prima chiamo story.Continue() che mi dà il contenuto, poi lo assegno alla variabile.
            string currentLine = story.Continue().Trim();

            if (currentLine == "@interact")
            {
                dialoguePanel.SetActive(false);
                //Interact è la nostra prima eccezione. Se ho un interact, vuol dire che sono nell'hub principale, e qui troverò la lista di tutte le entità interagibili nel gioco.
                //Quello che devo capire ora è quali siano attive e quali no, per cui il tunnel, che porta allo stitch dell'oggetto, avrà la sue condizioni per apparire o meno (es: se siamo nello stesso luogo).
                //Tutto quello che mi serve ora è di verificare che ogni singola scelta (perché nella struttura creata il nostro tunnel ci porta sempre a una scelta, es + [mentore]) sia o meno attiva (come in Loop: + {are_two_entities_together(Elia, Ettore) && peopleTalking==false} [character:Elia] -> elia_acting ->).
                //E se è attiva, trasformare un valore booleano da falso a vero.
                //Per fare tutta questa cosa, utilizziamo una versione semplificata del for. Funziona per array, liste.

                //Entity è una variabile locale creata per questo foreach, che viene associata a tutti i GameObject "entities" che abbiamo caricato su Unity.
                foreach (var entity in entities)
                {
                    bool found = false;

                    //Choice è una variabile locale creata per questo foreach, a cui viene associata una choice in INK (story.currentChoices, dove "story" è il nome che abbiamo dato noi alla nostra storia, e currentChoices è una delle funzione di INK)
                    foreach (var choice in story.currentChoices)
                    {
                        //Qui abbiamo recuperato il testo della scelta e l'abbiamo assegnato a una variabile
                        var choiceText = choice.text.Trim();
                        //Qui abbiamo recuperato il nome del nostro game object e l'abbiamo assegnato a una variabile
                        var entityName = entity.name;
                        //Qui verifichiamo se le due cose sono uguali o no
                        if (entityName == choiceText)
                        {
                            found = true;
                        }
                    }

                    //Invece di fare check if/else, dato che valore found true/false sempre, chiamo direttamente SetActive(found);
                    entity.SetActive(found);

                    
                    //Ci sono altre cose che dobbiamo fare con i contenuti di @interact?
                    //Plausibilmente non in questa funzione: sicuramente gli oggetti in scena poi ci passeranno dei testi quando interagiremo con loro, ma per questo aspetto conviene fare una funzione sperata, perché è una cosa diversa.

                }
            }
            // //Qui posso inserire ulteriori eccezioni (es: @move, se dovessi farne uso?)
            

            //Se invece la storia può continuare (story.canContinue == true) ma non ci sono eccezioni, cosa voglio che accada?
            //Che all'interazione con un oggetto, parta il corrispettivo dialogo.
            //Forse un primo step può essere solo che se clicco un oggetto si apre il box di dialogo.
            //E che poi venga stampata una frase (senza fare un distinguo tra chi dice cosa, che potrei fare poi).
            //E per far questa cosa, devo associare il testo di ink al box di testo di Unity (cosa più easy).

            //Elemento aggiunto dopo l'ultima "lezione" di Mattia
            //Da qui in sotto son tutti tentativi di far partire il dialogo, tentativi che NON VANNO, sob
            else
            {
                //Attiviamo il panel di dialogo
                dialoguePanel.SetActive(true);
                //Associamo al testo di Unity il testo di INK.
                dialogueText.text = story.Continue();
                DisplayChoices();
            }

        }
    }

        


//Mi serve per cominciare la conversazione
    public void OnClick(string entity)
    {
        //scorriamo tutte le scelte possibili, e poi confrontiamo ogni scelta con il valore di stringa "entity"
        foreach (var choice in story.currentChoices)
        {
            if(choice.text.Trim() == entity)
            {
                //In questo modo recuperiamo il valore indice di una scelta
                var choiceIndex = choice.index;
                //Questo è "scegli questo indice di scelta", vai a questa scelta (Es: mentore 0 come indice, vai alla scelta 0, quindi il mentore)
                story.ChooseChoiceIndex(choiceIndex);
                //In ink questo significa andare all'inizio della parentesi quadra (+[xsxx]), non ha ancora compito la scelta.
                //Attiviamo il panel di dialogo
                dialoguePanel.SetActive(true);
                //Associamo al testo di Unity il testo di INK.
                ContinueStory(); 
                break;
                //break esce dal primo ciclo che trova, in modo da evitare che mi vada a testare tutto il rimanente. Metterla sempre.
            }
        }
    }

//Elemento aggiunto dopo l'ultima "lezione" di Mattia
//Questa roba ti permette di attivare i tasti e metterci il testo, adattala poi a questa situazione (viene dal prototipo originale.)
    private void DisplayChoices()
    {
        List<Choice> currentChoices = story.currentChoices;

        //Questo è un check per essere sicura che non ci siano in ink più scelte di quante non siano accessibili nell'interfaccia di unity
        if (currentChoices.Count > choices.Length)
        {
            Debug.LogError("More choices were given than the UI che support. Number of choice given; " + currentChoices.Count);
        }

        int index = 0;

        //enable and initialize the choices up to the amount of choices for this line of dialogue
        foreach(Choice choice in currentChoices)
        {
            choices[index].gameObject.SetActive(true);
            choicesText[index].text = choice.text;
            index++;
        }

        //skippa poi le scelte che sono vuote e non vanno attivate nell'interfaccia
        for(int i = index; i <choices.Length; i++)
        {
            choices[i].gameObject.SetActive(false);
        }

        StartCoroutine(SelectFirstChoice());

    }


    //Questa funzione risolve il problema per cui non ci sono opzioni cliccabili evidenziando la prima di default.
    private IEnumerator SelectFirstChoice()
    {
        //EventSystem chiede prima di venir svuotato, poi di selezionare il primo utile
        EventSystem.current.SetSelectedGameObject(null);
        yield return new WaitForEndOfFrame();
        EventSystem.current.SetSelectedGameObject(choices[0].gameObject);

    }

    public void MakeChoice(int choiceIndex)
    {
        story.ChooseChoiceIndex(choiceIndex);
        //Abbiamo messo questa cosa perché ink prima si sposta sulla scelta, e poi avanza. cosa che nel codice prima non c'era
        ContinueStory();
    }

    //Elemento aggiunto dopo l'ultima "lezione" di Mattia. Spoiler: è un disastro
    //  private void HandleTags(List<string> currentTags)
    // {
    //     //loopiamo la comunque
    //     foreach (string tag in currentTags)
    //     {
    //         //dividi il tag in base al :
    //         string[] splitTag = tag.Split(':');
    //         //Check di sicurezza per evitare che ci siano più di due elementi
    //         if (splitTag.Length != 2)
    //         {
    //             Debug.LogError("Tag could not appropriately parsed: " + tag);
    //         }
    //         //Posso partire da qui per recuperare il nome del parlante?
    //         string tagKey = splitTag[0].Trim();
    //         string tagValue = splitTag[1].Trim();

            //Da qui partiamo con uno switch dei tag
            // switch (tagKey)
            // {
            //     case BACKGROUND_TAG:
            //         //newSprite = tagKey;
            //         //background.sprite = newSprite;

            //         //displayNameText è l'oggetto creato in Unity per mostrare il nome.
            //         //displayNameText.text = tagValue;
            //         break;
          


            //      default: 
            //      Debug.LogWarning("Tag came in but is not currently handled: "+ tag);
            //      break;  
            // }

        }
    

