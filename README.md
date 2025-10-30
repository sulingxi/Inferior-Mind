# Inferior-Mind
autore: Suleo

Descrizione
Piccolo progetto fatto in Flutter per provare a ricreare in modo semplice il gioco Master Mind. 
Il gioco genera un codice segreto di 4 colori, e il giocatore deve indovinare la combinazione giusta. 
Ogni pulsante cambia colore quando viene cliccato (grigio, rosso, verde, blu, giallo). 
Quando pensi di aver trovato la giusta sequenza, premi il bottone con la spunta ✔️ per controllare.

Se indovini, compare un messaggio di vittoria; se sbagli, puoi riprovare.




Ho deciso di usare solo una pagina (StatefulWidget) per gestire tutto, con `setState()` per aggiornare i colori.
Il codice segreto viene generato in modo casuale con la classe `Random`.
Non ho usato librerie esterne, solo il materiale base.
Ho lasciato un `print` nel terminale per vedere il codice segreto (solo per test).


Funzionamento
1. All’avvio si crea un codice segreto (4 numeri da 1 a 4).
2. L’utente cambia i colori cliccando sui 4 bottoni.
3. Cliccando il pulsante con ✔️, il programma controlla se è uguale al codice segreto.
4. Se è giusto appare un messaggio "Hai vinto!", altrimenti "Sbagliato".
5. Dopo aver premuto OK il gioco si resetta e parte una nuova combinazione.
