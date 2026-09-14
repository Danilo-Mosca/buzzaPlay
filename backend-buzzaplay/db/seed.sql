BEGIN;

INSERT INTO categorie (nome) VALUES
('Storia'),
('Arte'),
('Geografia'),
('Scienze'),
('Sport'),
('Cinema'),
('Musica'),
('Letteratura'),
('Tecnologia'),
('Fumetti, favole e cartoni'),
('Videogiochi'),
('Politica'),
('Attualità'),
('Economia')
ON CONFLICT (nome) DO NOTHING;


INSERT INTO domande (
    categoria_id,
    difficolta,
    domanda,
    risposta_corretta,
    risposta_errata_1,
    risposta_errata_2,
    risposta_errata_3
)
VALUES

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Chi fu il primo imperatore dell''Impero Romano?',
'Augusto',
'Giulio Cesare',
'Nerone',
'Traiano'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'In quale anno Cristoforo Colombo raggiunse l''America?',
'1492',
'1453',
'1517',
'1500'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale muro cadde nel 1989 segnando la fine della Guerra Fredda?',
'Muro di Berlino',
'Muro di Adriano',
'Grande Muraglia Cinese',
'Muro del Pianto'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Chi guidò la spedizione dei Mille?',
'Giuseppe Garibaldi',
'Giuseppe Mazzini',
'Camillo Benso di Cavour',
'Vittorio Emanuele II'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'In quale paese ebbe origine la Rivoluzione Francese?',
'Francia',
'Germania',
'Belgio',
'Austria'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Quale civiltà costruì Machu Picchu?',
'Inca',
'Maya',
'Aztechi',
'Egizi'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'In quale anno iniziò la Prima Guerra Mondiale?',
'1914',
'1912',
'1916',
'1918'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Chi guidò la Germania durante il nazismo?',
'Adolf Hitler',
'Benito Mussolini',
'Joseph Stalin',
'Winston Churchill'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Dove nacque la democrazia?',
'Atene',
'Roma',
'Sparta',
'Alessandria'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale faraone è associato alla famosa maschera d''oro?',
'Tutankhamon',
'Ramses II',
'Cheope',
'Akhenaton'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Chi pronunciò la frase "Veni, vidi, vici"?',
'Giulio Cesare',
'Nerone',
'Augusto',
'Pompeo'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Quale impero medievale di lingua prevalentemente greca ebbe Costantinopoli come capitale?',
'Impero Bizantino',
'Impero Romano d''Occidente',
'Impero Ottomano',
'Impero Persiano'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'In quale anno terminò la Seconda Guerra Mondiale?',
'1945',
'1943',
'1944',
'1946'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Chi fu il primo uomo a mettere piede sulla Luna?',
'Neil Armstrong',
'Buzz Aldrin',
'Yuri Gagarin',
'Michael Collins'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale popolo costruì il Colosseo?',
'Romani',
'Greci',
'Etruschi',
'Fenici'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale città fu distrutta dall''eruzione del Vesuvio nel 79 d.C.?',
'Pompei',
'Napoli',
'Ercolano',
'Salerno'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Chi fu l''ultimo zar di Russia?',
'Nicola II',
'Pietro il Grande',
'Alessandro III',
'Ivan il Terribile'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'In quale continente nacque l''uomo secondo le teorie scientifiche più diffuse?',
'Africa',
'Europa',
'Asia',
'America'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale guerra oppose Nord e Sud degli Stati Uniti?',
'Guerra Civile Americana',
'Guerra Fredda',
'Guerra dei Sette Anni',
'Guerra d''Indipendenza'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Chi fu il principale artefice dell''unificazione italiana come presidente del Consiglio del Regno di Sardegna?',
'Camillo Benso di Cavour',
'Giuseppe Garibaldi',
'Giuseppe Mazzini',
'Vittorio Emanuele III'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'In quale anno cadde l''Impero Romano d''Occidente?',
'476',
'410',
'500',
'395'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Chi scoprì la penicillina?',
'Alexander Fleming',
'Louis Pasteur',
'Isaac Newton',
'Gregor Mendel'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale civiltà costruì le piramidi di Giza?',
'Egizi',
'Babilonesi',
'Assiri',
'Persiani'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Dove fu firmata la Magna Carta nel 1215?',
'Inghilterra',
'Francia',
'Scozia',
'Irlanda'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Qual era la capitale dell''Impero Romano?',
'Roma',
'Milano',
'Ravenna',
'Napoli'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Chi fu il primo presidente degli Stati Uniti?',
'George Washington',
'Abraham Lincoln',
'Thomas Jefferson',
'John Adams'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Quale navigatore completò la prima circumnavigazione del globo dopo la morte di Ferdinando Magellano?',
'Juan Sebastián Elcano',
'Cristoforo Colombo',
'Vasco da Gama',
'James Cook'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale evento segna convenzionalmente l''inizio del Medioevo?',
'Caduta dell''Impero Romano d''Occidente',
'Scoperta dell''America',
'Rivoluzione Francese',
'Nascita di Cristo'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Chi era il padre di Alessandro Magno?',
'Filippo II',
'Dario I',
'Serse',
'Tolomeo'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Dove si trovava il celebre faro considerato una delle Sette Meraviglie del mondo antico?',
'Alessandria d''Egitto',
'Atene',
'Cartagine',
'Troia'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale trattato del 1648 pose ufficialmente fine alla Guerra dei Trent''anni?',
'Pace di Vestfalia',
'Trattato di Utrecht',
'Pace di Augusta',
'Trattato di Nimega'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale imperatore bizantino promosse la raccolta del Corpus Iuris Civilis?',
'Giustiniano I',
'Eraclio I',
'Basilio II',
'Alessio I Comneno'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale battaglia del 732 arrestò l''avanzata araba in Europa occidentale?',
'Battaglia di Poitiers',
'Battaglia di Adrianopoli',
'Battaglia di Manzicerta',
'Battaglia di Lepanto'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale dinastia governò la Cina durante le spedizioni navali dell''ammiraglio Zheng He?',
'Dinastia Ming',
'Dinastia Yuan',
'Dinastia Qing',
'Dinastia Song'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale città fu capitale dell''Impero bizantino fino alla sua caduta nel 1453?',
'Costantinopoli',
'Nicea',
'Antiochia',
'Smirne'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Con quale nome postumo è noto l''imperatore giapponese Mutsuhito?',
'Imperatore Meiji',
'Imperatore Taishō',
'Imperatore Shōwa',
'Imperatore Kōmei'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale trattato del 1713 assegnò Gibilterra alla Gran Bretagna?',
'Trattato di Utrecht',
'Trattato di Tordesillas',
'Trattato di Versailles',
'Pace di Westfalia'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale generale cartaginese sconfisse i Romani nella battaglia di Canne?',
'Annibale',
'Amilcare Barca',
'Asdrubale',
'Magon Barca'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'In quale regione dell''attuale Svizzera sorge il castello da cui prese il nome la dinastia degli Asburgo?',
'Canton Argovia',
'Canton Berna',
'Canton Zurigo',
'Canton Lucerna'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale conferenza del febbraio 1945 riunì Churchill, Roosevelt e Stalin in Crimea?',
'Conferenza di Jalta',
'Conferenza di Potsdam',
'Conferenza di Teheran',
'Conferenza di Monaco'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale sovrano inglese firmò la Magna Carta nel 1215?',
'Giovanni Senza Terra',
'Enrico II',
'Edoardo I',
'Riccardo II'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale città divenne capitale ottomana nel 1326, dopo la sua conquista da parte di Orhan I?',
'Bursa',
'Edirne',
'Ankara',
'Smirne'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale evento del 1054 sancì la separazione definitiva tra Chiesa d''Oriente e Chiesa d''Occidente?',
'Grande Scisma d''Oriente',
'Scisma d''Occidente',
'Concilio di Trento',
'Concilio di Costanza'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale repubblica marinara sconfisse Pisa nella battaglia della Meloria del 1284?',
'Genova',
'Venezia',
'Amalfi',
'Ragusa'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale crisi internazionale del 1962 portò il mondo sull''orlo di una guerra nucleare?',
'Crisi dei missili di Cuba',
'Blocco di Berlino',
'Guerra di Corea',
'Crisi di Suez'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale sovrano francese era soprannominato Re Sole?',
'Luigi XIV',
'Luigi XVI',
'Francesco I',
'Enrico IV'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale popolo dell''antichità utilizzava la scrittura cuneiforme in Mesopotamia?',
'Sumeri',
'Etruschi',
'Fenici',
'Celti'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale regina d''Egitto fu alleata di Marco Antonio?',
'Cleopatra VII',
'Nefertiti',
'Hatshepsut',
'Nefertari'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale invenzione di Gutenberg favorì la diffusione dei libri in Europa nel Quattrocento?',
'La stampa a caratteri mobili metallici',
'La macchina da scrivere',
'La litografia',
'La stampa offset'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale città giapponese fu colpita dalla prima bomba atomica usata in guerra?',
'Hiroshima',
'Nagasaki',
'Osaka',
'Kyoto'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale esploratore veneziano raccontò i suoi viaggi in Asia nel Milione?',
'Marco Polo',
'Amerigo Vespucci',
'Giovanni Caboto',
'Vasco da Gama'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale sovrano fu sconfitto definitivamente a Waterloo?',
'Napoleone Bonaparte',
'Federico II di Prussia',
'Luigi XIV',
'Carlo V'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'In quale paese ebbe inizio la Rivoluzione industriale del Settecento?',
'Gran Bretagna',
'Spagna',
'Russia',
'Italia'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale movimento religioso ebbe tra i suoi protagonisti Martin Lutero?',
'Riforma protestante',
'Monachesimo benedettino',
'Movimento francescano',
'Controriforma cattolica'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'facile',
'Quale antica popolazione abitava soprattutto l''Etruria prima dell''espansione di Roma?',
'Etruschi',
'Sanniti',
'Liguri',
'Veneti'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Quale trattato del 1919 impose le condizioni di pace alla Germania dopo la Prima guerra mondiale?',
'Trattato di Versailles',
'Trattato di Brest-Litovsk',
'Trattato di Losanna',
'Trattato di Rapallo'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Quale sovrana inglese regnava durante la sconfitta dell''Invincibile Armata nel 1588?',
'Elisabetta I',
'Maria I Tudor',
'Anna Stuart',
'Vittoria'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Chi guidò la rivoluzione haitiana prima di essere catturato dai francesi nel 1802?',
'Toussaint Louverture',
'Simón Bolívar',
'José de San Martín',
'Miguel Hidalgo'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Quale imperatore estese nel 212 la cittadinanza romana a quasi tutti gli abitanti liberi dell''impero?',
'Caracalla',
'Diocleziano',
'Adriano',
'Claudio'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Quale paese fu invaso dalla Germania il 1º settembre 1939?',
'Polonia',
'Danimarca',
'Belgio',
'Norvegia'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Quale città ospitò il congresso che ridisegnò l''Europa dopo le guerre napoleoniche?',
'Vienna',
'Berlino',
'Parigi',
'Praga'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Quale dinastia russa salì al trono nel 1613?',
'Romanov',
'Rjurikidi',
'Jagelloni',
'Vasa'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Quale battaglia del 1066 consentì a Guglielmo di Normandia di conquistare il trono inglese?',
'Hastings',
'Azincourt',
'Bannockburn',
'Bosworth'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Quale rivoluzione portò alla caduta dello zar nel 1917, prima della presa del potere bolscevica?',
'Rivoluzione di febbraio',
'Rivoluzione d''ottobre',
'Rivoluzione del 1905',
'Rivoluzione di luglio del 1830'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'medio',
'Quale paese africano sconfisse l''esercito italiano ad Adua nel 1896?',
'Etiopia',
'Egitto',
'Sudan',
'Libia'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale accordo del 1122 regolò la lotta per le investiture tra papato e impero?',
'Concordato di Worms',
'Concordato di Bologna',
'Pace di Augusta',
'Trattato di Verdun'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale sovrano persiano fu sconfitto da Alessandro Magno a Gaugamela?',
'Dario III',
'Serse I',
'Ciro II',
'Artaserse I'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale trattato del 1494 divise le nuove aree di espansione oltremare tra Spagna e Portogallo?',
'Trattato di Tordesillas',
'Trattato di Alcáçovas',
'Trattato di Saragozza',
'Trattato di Cateau-Cambrésis'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale dinastia cinese governò immediatamente prima dei Ming?',
'Yuan',
'Tang',
'Qing',
'Han'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale regno africano ebbe come sovrano Mansa Musa nel XIV secolo?',
'Impero del Mali',
'Regno di Aksum',
'Impero del Ghana',
'Regno del Kongo'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale editto del 1685 revocò quello di Nantes, limitando il culto protestante in Francia?',
'Editto di Fontainebleau',
'Editto di Milano',
'Editto di Saint-Germain del 1562',
'Editto di Beaulieu'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale battaglia navale del 1571 vide la Lega Santa sconfiggere la flotta ottomana?',
'Lepanto',
'Prevesa',
'Navarino',
'Abukir'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale imperatore romano fu catturato dal sovrano sasanide Sapore I nel 260?',
'Valeriano',
'Aureliano',
'Decio',
'Gallieno'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale documento del 1356 disciplinò l''elezione dell''imperatore del Sacro Romano Impero?',
'Bolla d''oro',
'Constitutio de feudis',
'Dictatus papae',
'Prammatica Sanzione del 1713'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale conferenza del 1955 riunì in Indonesia rappresentanti di paesi asiatici e africani?',
'Conferenza di Bandung',
'Conferenza di Bretton Woods',
'Conferenza di Teheran',
'Conferenza di San Francisco'
);

INSERT INTO domande (
    categoria_id,
    difficolta,
    domanda,
    risposta_corretta,
    risposta_errata_1,
    risposta_errata_2,
    risposta_errata_3
)
VALUES

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Chi ha dipinto la Gioconda?',
'Leonardo da Vinci',
'Michelangelo',
'Raffaello',
'Caravaggio'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Dove si trova la Gioconda di Leonardo da Vinci?',
'Museo del Louvre',
'Galleria degli Uffizi',
'Musei Vaticani',
'British Museum'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Chi ha dipinto la volta della Cappella Sistina?',
'Michelangelo',
'Leonardo da Vinci',
'Botticelli',
'Tiziano'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale artista è famoso per il dipinto La notte stellata?',
'Vincent van Gogh',
'Claude Monet',
'Pablo Picasso',
'Salvador Dalí'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale artista ha realizzato la scultura del David?',
'Michelangelo',
'Donatello',
'Bernini',
'Canova'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale movimento artistico nacque all''inizio del Novecento con Picasso e Braque?',
'Cubismo',
'Impressionismo',
'Surrealismo',
'Futurismo'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Chi dipinse il quadro Guernica?',
'Pablo Picasso',
'Francisco Goya',
'Joan Miró',
'Paul Cézanne'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale artista è associato al movimento impressionista?',
'Claude Monet',
'Leonardo da Vinci',
'Andy Warhol',
'Michelangelo'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale edificio è considerato un capolavoro dell''architettura di Antoni Gaudí?',
'Sagrada Família',
'Colosseo',
'Notre-Dame',
'Partenone'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'In quale città si trova il museo degli Uffizi?',
'Firenze',
'Roma',
'Milano',
'Venezia'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Chi è l''autore della scultura Il pensatore?',
'Auguste Rodin',
'Donatello',
'Bernini',
'Brancusi'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale tecnica pittorica utilizza pigmenti mescolati con acqua e applicati su intonaco fresco?',
'Affresco',
'Acquerello',
'Olio su tela',
'Incisione'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale artista italiano è famoso per il dipinto Canestra di frutta?',
'Caravaggio',
'Raffaello',
'Modigliani',
'Tintoretto'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale movimento artistico è associato a Salvador Dalí?',
'Surrealismo',
'Realismo',
'Barocco',
'Neoclassicismo'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Chi dipinse La nascita di Venere?',
'Sandro Botticelli',
'Raffaello',
'Tiziano',
'Masaccio'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale materiale viene principalmente utilizzato nella scultura classica del David di Michelangelo?',
'Marmo',
'Bronzo',
'Legno',
'Argilla'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale periodo artistico seguì il Medioevo e riscoprì la cultura classica?',
'Rinascimento',
'Barocco',
'Romanticismo',
'Gotico'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Chi progettò e realizzò il monumentale Baldacchino di San Pietro?',
'Gian Lorenzo Bernini',
'Michelangelo',
'Canova',
'Donatello'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale artista è famoso per il dipinto American Gothic?',
'Grant Wood',
'Edward Hopper',
'Jackson Pollock',
'Roy Lichtenstein'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale città italiana è famosa per la Biennale d''Arte?',
'Venezia',
'Firenze',
'Roma',
'Torino'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale pittore italiano è noto per l''uso del chiaroscuro?',
'Caravaggio',
'Modigliani',
'De Chirico',
'Fontana'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale museo ospita opere di molti artisti rinascimentali a Firenze?',
'Galleria degli Uffizi',
'Museo Egizio',
'Pompidou',
'Prado'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Chi è considerato uno dei maggiori esponenti della Pop Art?',
'Andy Warhol',
'Monet',
'Van Gogh',
'Dalí'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale movimento artistico italiano celebrava velocità e tecnologia?',
'Futurismo',
'Romanticismo',
'Impressionismo',
'Realismo'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale artista è autore del dipinto La scuola di Atene?',
'Raffaello',
'Michelangelo',
'Leonardo',
'Botticelli'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale artista è famoso per le sue opere con figure geometriche e colori intensi?',
'Piet Mondrian',
'Caravaggio',
'Goya',
'Rembrandt'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale civiltà costruì il Partenone?',
'Greci',
'Romani',
'Egizi',
'Persiani'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale artista italiano è considerato uno dei massimi esponenti del Neoclassicismo nella scultura?',
'Antonio Canova',
'Bernini',
'Donatello',
'Modigliani'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale colore si ottiene mescolando blu e giallo?',
'Verde',
'Arancione',
'Viola',
'Rosso'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale artista realizzò il ciclo di affreschi della Cappella degli Scrovegni a Padova?',
'Giotto',
'Cimabue',
'Masaccio',
'Beato Angelico'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'In quale città è conservata la celebre Pala di Isenheim di Matthias Grünewald?',
'Colmar',
'Strasburgo',
'Monaco di Baviera',
'Norimberga'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale architetto progettò la cupola della Cattedrale di Santa Maria del Fiore a Firenze?',
'Filippo Brunelleschi',
'Leon Battista Alberti',
'Donato Bramante',
'Andrea Palladio'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale pittore fiammingo è autore del Polittico dell''Agnello Mistico?',
'Jan van Eyck',
'Pieter Bruegel il Vecchio',
'Rogier van der Weyden',
'Hans Memling'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale movimento artistico fondò Kazimir Malevič?',
'Suprematismo',
'Costruttivismo',
'Futurismo',
'Cubismo'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale scultore realizzò il gruppo del Ratto di Proserpina conservato alla Galleria Borghese?',
'Gian Lorenzo Bernini',
'Alessandro Algardi',
'Antonio Canova',
'Francesco Mochi'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale pittore spagnolo è autore de "Las Meninas"?',
'Diego Velázquez',
'Francisco Goya',
'El Greco',
'Bartolomé Esteban Murillo'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale artista dipinse il celebre quadro "L''isola dei morti"?',
'Arnold Böcklin',
'Gustave Moreau',
'Odilon Redon',
'Caspar David Friedrich'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale architetto è considerato il principale esponente del Palladianesimo?',
'Andrea Palladio',
'Giulio Romano',
'Baldassarre Peruzzi',
'Jacopo Sansovino'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale museo ospita il dipinto "La ronda di notte" di Rembrandt?',
'Rijksmuseum',
'Mauritshuis',
'Museo del Prado',
'National Gallery'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale pittore francese è considerato il principale esponente del Fauvismo?',
'Henri Matisse',
'Georges Braque',
'Paul Signac',
'Pierre Bonnard'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale artista scolpì il Mosè conservato nella Basilica di San Pietro in Vincoli?',
'Michelangelo Buonarroti',
'Donatello',
'Andrea del Verrocchio',
'Benvenuto Cellini'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale edificio progettato da Frank Lloyd Wright è noto per la sua integrazione con una cascata?',
'Casa sulla cascata',
'Robie House',
'Unity Temple',
'Taliesin West'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale pittore olandese realizzò "La lattaia"?',
'Johannes Vermeer',
'Frans Hals',
'Rembrandt',
'Pieter de Hooch'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale artista è autore della celebre incisione "Melencolia I"?',
'Albrecht Dürer',
'Hans Holbein il Giovane',
'Lucas Cranach il Vecchio',
'Matthias Grünewald'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale pittore surrealista realizzò "La persistenza della memoria"?',
'Salvador Dalí',
'René Magritte',
'Joan Miró',
'Max Ernst'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale pittrice messicana è nota per i suoi numerosi autoritratti e per il dipinto Le due Frida?',
'Frida Kahlo',
'Tamara de Lempicka',
'Georgia O''Keeffe',
'Berthe Morisot'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale tecnica crea un''immagine accostando piccole tessere di pietra o vetro?',
'Mosaico',
'Acquaforte',
'Acquerello',
'Carboncino'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale pittore norvegese realizzò L''urlo?',
'Edvard Munch',
'Gustav Klimt',
'Egon Schiele',
'Paul Klee'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale elemento architettonico a punta è tipico delle cattedrali gotiche?',
'Arco a sesto acuto',
'Arco a tutto sesto',
'Architrave orizzontale',
'Cupola emisferica'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'In quale città spagnola si trova il Museo del Prado?',
'Madrid',
'Barcellona',
'Siviglia',
'Bilbao'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale artista dipinse Il bacio con ampie decorazioni dorate?',
'Gustav Klimt',
'Edvard Munch',
'Henri Rousseau',
'Amedeo Modigliani'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Come si chiama un dipinto che raffigura soprattutto oggetti inanimati, come vasi e frutti?',
'Natura morta',
'Ritratto',
'Paesaggio',
'Pittura di storia'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale strumento sostiene la tela mentre il pittore lavora?',
'Cavalletto',
'Torchio',
'Bulino',
'Compasso'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale scultura antica raffigura un atleta nell''atto di lanciare un disco?',
'Discobolo',
'Laocoonte',
'Doriforo',
'Galata morente'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'facile',
'Quale artista è celebre per sculture mobili sospese che si muovono con l''aria?',
'Alexander Calder',
'Auguste Rodin',
'Henry Moore',
'Alberto Giacometti'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale pittore dipinse Una domenica pomeriggio all''isola della Grande Jatte?',
'Georges Seurat',
'Paul Gauguin',
'Camille Pissarro',
'Alfred Sisley'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale architetto progettò il Guggenheim Museum di Bilbao?',
'Frank Gehry',
'Renzo Piano',
'Norman Foster',
'Santiago Calatrava'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale artista realizzò il ready-made Fountain, un orinatoio presentato come opera d''arte?',
'Marcel Duchamp',
'Man Ray',
'Max Ernst',
'Jean Arp'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale movimento artistico comprende le opere di Ernst Ludwig Kirchner e del gruppo Die Brücke?',
'Espressionismo',
'Realismo',
'Neoclassicismo',
'Divisionismo'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale pittrice seicentesca realizzò una celebre Giuditta che decapita Oloferne conservata agli Uffizi?',
'Artemisia Gentileschi',
'Sofonisba Anguissola',
'Lavinia Fontana',
'Elisabetta Sirani'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale pittore è noto per le sue vedute di Venezia e si chiamava Giovanni Antonio Canal?',
'Canaletto',
'Guardi',
'Tiepolo',
'Longhi'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'In quale città si trova il complesso del Bauhaus progettato da Walter Gropius nel 1925-1926?',
'Dessau',
'Monaco di Baviera',
'Colonia',
'Amburgo'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale tecnica di incisione utilizza un acido per scavare i segni su una lastra metallica?',
'Acquaforte',
'Xilografia',
'Linoleografia',
'Puntasecca'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale pittore francese rappresentò spesso ballerine e prove di danza?',
'Edgar Degas',
'Gustave Courbet',
'Jean-François Millet',
'Eugène Delacroix'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'medio',
'Quale scultore realizzò Forme uniche della continuità nello spazio?',
'Umberto Boccioni',
'Giacomo Manzù',
'Medardo Rosso',
'Marino Marini'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale artista progettò la spirale di pietre Spiral Jetty nel Great Salt Lake?',
'Robert Smithson',
'Richard Serra',
'Donald Judd',
'Dan Flavin'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale architetto barocco progettò la chiesa romana di San Carlo alle Quattro Fontane?',
'Francesco Borromini',
'Carlo Maderno',
'Baldassarre Longhena',
'Filippo Juvarra'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale pittore realizzò Il quarto stato, conservato a Milano?',
'Giuseppe Pellizza da Volpedo',
'Giovanni Segantini',
'Gaetano Previati',
'Angelo Morbelli'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale artista giapponese realizzò la xilografia La grande onda presso Kanagawa?',
'Katsushika Hokusai',
'Utagawa Hiroshige',
'Kitagawa Utamaro',
'Tōshūsai Sharaku'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale teorico rinascimentale scrisse il trattato De pictura nel 1435?',
'Leon Battista Alberti',
'Giorgio Vasari',
'Andrea Palladio',
'Sebastiano Serlio'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale pittore è autore della Flagellazione di Cristo conservata a Urbino?',
'Piero della Francesca',
'Paolo Uccello',
'Andrea Mantegna',
'Domenico Ghirlandaio'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale fotografo realizzò nel 1936 l''immagine nota come Migrant Mother?',
'Dorothea Lange',
'Walker Evans',
'Margaret Bourke-White',
'Diane Arbus'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale gruppo artistico fu fondato a Monaco nel 1911 da Kandinskij e Franz Marc?',
'Der Blaue Reiter',
'Die Neue Sachlichkeit',
'De Stijl',
'Les Nabis'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale artista brasiliana dipinse Abaporu nel 1928?',
'Tarsila do Amaral',
'Lygia Clark',
'Anita Malfatti',
'Lygia Pape'
),

(
(SELECT id FROM categorie WHERE nome = 'Arte'),
'difficile',
'Quale scultore realizzò le porte bronzee del Battistero di Firenze note come Porta del Paradiso?',
'Lorenzo Ghiberti',
'Donatello',
'Andrea del Verrocchio',
'Luca della Robbia'
);

INSERT INTO domande (
    categoria_id,
    difficolta,
    domanda,
    risposta_corretta,
    risposta_errata_1,
    risposta_errata_2,
    risposta_errata_3
)
VALUES

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Qual è la capitale dell''Italia?',
'Roma',
'Milano',
'Napoli',
'Firenze'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Qual è il continente più grande del mondo?',
'Asia',
'Africa',
'Europa',
'America'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Qual è il fiume più lungo del mondo secondo molte classifiche geografiche?',
'Amazzoni',
'Nilo',
'Mississippi',
'Yangtze'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Qual è la capitale della Francia?',
'Parigi',
'Lione',
'Marsiglia',
'Bordeaux'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'In quale continente si trova il deserto del Sahara?',
'Africa',
'Asia',
'America',
'Oceania'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Qual è la montagna più alta del mondo?',
'Everest',
'K2',
'Monte Bianco',
'Kilimangiaro'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Qual è la capitale del Giappone?',
'Tōkyō',
'Kyōto',
'Osaka',
'Hiroshima'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale Paese ha la superficie più grande al mondo?',
'Russia',
'Canada',
'Cina',
'Stati Uniti'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Qual è la capitale della Spagna?',
'Madrid',
'Barcellona',
'Valencia',
'Siviglia'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Quale mare bagna le coste orientali dell''Italia?',
'Mare Adriatico',
'Mare Tirreno',
'Mare Ligure',
'Mare Ionio'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Qual è il lago più grande del mondo per superficie?',
'Lago Caspio',
'Lago Superiore',
'Lago Vittoria',
'Lago Bajkal'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Qual è la capitale della Germania?',
'Berlino',
'Monaco',
'Amburgo',
'Francoforte'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale stretto separa Europa e Africa?',
'Stretto di Gibilterra',
'Stretto di Bering',
'Stretto di Messina',
'Stretto di Bosforo'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Qual è la capitale degli Stati Uniti?',
'Washington D.C.',
'New York',
'Los Angeles',
'Chicago'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale Paese viene chiamato anche "Terra del Sol Levante"?',
'Giappone',
'Cina',
'Corea del Sud',
'Thailandia'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Qual è la capitale del Regno Unito?',
'Londra',
'Edimburgo',
'Manchester',
'Liverpool'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Qual è il deserto caldo più grande del mondo?',
'Sahara',
'Gobi',
'Kalahari',
'Atacama'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Quale città italiana è famosa per i suoi canali?',
'Venezia',
'Genova',
'Bologna',
'Palermo'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Qual è la capitale del Canada?',
'Ottawa',
'Toronto',
'Vancouver',
'Montreal'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Quale oceano bagna la costa occidentale dell''America?',
'Oceano Pacifico',
'Oceano Atlantico',
'Oceano Indiano',
'Oceano Artico'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Qual è il Paese più popoloso del mondo nel 2024?',
'India',
'Cina',
'Stati Uniti',
'Indonesia'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Qual è la capitale del Brasile?',
'Brasilia',
'Rio de Janeiro',
'Salvador',
'Belo Horizonte'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale catena montuosa separa in parte Europa e Asia?',
'Monti Urali',
'Alpi',
'Ande',
'Himalaya'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Qual è la capitale dell''Egitto?',
'Il Cairo',
'Alessandria',
'Luxor',
'Giza'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'In quale Stato federato degli Stati Uniti si trova la metropoli soprannominata "Grande Mela"?',
'New York',
'New Jersey',
'Massachusetts',
'Pennsylvania'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Qual è la capitale dell''Australia?',
'Canberra',
'Sydney',
'Melbourne',
'Perth'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale Paese ospita la foresta amazzonica per la maggior parte della sua estensione?',
'Brasile',
'Perù',
'Colombia',
'Venezuela'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Quale città è la capitale della Grecia?',
'Atene',
'Salonicco',
'Corinto',
'Sparta'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale vulcano si trova vicino a Napoli?',
'Vesuvio',
'Etna',
'Stromboli',
'Vulcano'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Qual è la capitale del Portogallo?',
'Lisbona',
'Porto',
'Braga',
'Faro'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale lago africano è considerato la sorgente principale del Nilo Bianco?',
'Lago Vittoria',
'Lago Tanganica',
'Lago Alberto',
'Lago Turkana'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Qual è il punto più basso della superficie terrestre emersa?',
'Sponda del Mar Morto',
'Depressione di Qattara',
'Valle della Morte',
'Depressione del Turpan'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale stretto separa l''isola di Tasmania dall''Australia continentale?',
'Stretto di Bass',
'Stretto di Torres',
'Stretto di Cook',
'Stretto di Magellano'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale tra questi fiumi sfocia nel Golfo del Bengala?',
'Brahmaputra',
'Indo',
'Mekong',
'Amur'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale paese possiede il maggior numero di fusi orari considerando anche i territori d''oltremare?',
'Francia',
'Russia',
'Stati Uniti',
'Regno Unito'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale deserto occupa gran parte del Botswana?',
'Kalahari',
'Namib',
'Danakil',
'Rub'' al-Khali'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale stato americano è l''unico a confinare esclusivamente con un altro stato degli USA?',
'Maine',
'Florida',
'Washington',
'California'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale isola è la più estesa del Mar Mediterraneo?',
'Sicilia',
'Sardegna',
'Cipro',
'Creta'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'In quale paese si trova la regione storica della Transilvania?',
'Romania',
'Ungheria',
'Slovacchia',
'Serbia'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale capitale europea sorge alla confluenza dei fiumi Sava e Danubio?',
'Belgrado',
'Bratislava',
'Budapest',
'Vienna'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale arcipelago portoghese si trova nell''Atlantico settentrionale a circa 1.500 km dal continente europeo?',
'Azzorre',
'Madeira',
'Canarie',
'Capo Verde'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale monte è la vetta più alta delle Ande?',
'Aconcagua',
'Huascarán',
'Chimborazo',
'Ojos del Salado'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale paese è attraversato sia dall''Equatore sia dal Tropico del Capricorno?',
'Brasile',
'Indonesia',
'Kenya',
'Repubblica Democratica del Congo'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale mare bagna contemporaneamente le coste di Israele, Libano e Cipro?',
'Mar Mediterraneo',
'Mar Rosso',
'Mar Nero',
'Mar Caspio'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale città è la capitale amministrativa del Sudafrica?',
'Pretoria',
'Città del Capo',
'Bloemfontein',
'Johannesburg'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Quale fiume attraversa Budapest?',
'Danubio',
'Reno',
'Senna',
'Elba'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Quale paese sudamericano ha una forma lunga e stretta lungo il Pacifico?',
'Cile',
'Uruguay',
'Paraguay',
'Ecuador'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Quale catena montuosa separa la penisola iberica dal resto dell''Europa?',
'Pirenei',
'Carpazi',
'Appennini',
'Balcani'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'In quale paese si trova la città di Marrakech?',
'Marocco',
'Tunisia',
'Algeria',
'Egitto'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Quale mare si trova tra Italia meridionale e Grecia occidentale?',
'Mar Ionio',
'Mar Tirreno',
'Mar Nero',
'Mar di Marmara'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Quale città è la capitale dell''Irlanda?',
'Dublino',
'Belfast',
'Cardiff',
'Edimburgo'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Quale grande isola si trova al largo della costa sudorientale dell''Africa?',
'Madagascar',
'Sri Lanka',
'Sumatra',
'Cuba'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Quale paese scandinavo ha Oslo come capitale?',
'Norvegia',
'Svezia',
'Danimarca',
'Islanda'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'In quale oceano si trova l''arcipelago delle Hawaii?',
'Oceano Pacifico',
'Oceano Atlantico',
'Oceano Indiano',
'Oceano Artico'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'facile',
'Quale regione italiana ha Perugia come capoluogo?',
'Umbria',
'Marche',
'Abruzzo',
'Molise'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale stretto separa l''Asia dall''America settentrionale?',
'Stretto di Bering',
'Stretto di Malacca',
'Stretto di Hormuz',
'Stretto di Magellano'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale paese ospita la città storica di Petra?',
'Giordania',
'Libano',
'Oman',
'Siria'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale lago sudamericano è condiviso da Perù e Bolivia?',
'Titicaca',
'Maracaibo',
'Nicaragua',
'Lago Argentino'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale capitale europea sorge sul fiume Moldava?',
'Praga',
'Varsavia',
'Bratislava',
'Lubiana'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale paese è interamente circondato dal Sudafrica?',
'Lesotho',
'Eswatini',
'Botswana',
'Namibia'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale deserto si estende lungo la costa del Cile settentrionale?',
'Atacama',
'Namib',
'Gobi',
'Sonora'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale fiume attraversa Baghdad?',
'Tigri',
'Eufrate',
'Giordano',
'Oronte'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale arcipelago spagnolo comprende Tenerife e Lanzarote?',
'Canarie',
'Baleari',
'Azzorre',
'Madeira'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale stato degli USA ospita il Grand Canyon?',
'Arizona',
'Utah',
'Colorado',
'Nevada'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'medio',
'Quale paese dell''Asia sudorientale non ha sbocchi sul mare?',
'Laos',
'Cambogia',
'Myanmar',
'Vietnam'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale stretto collega il Mar Nero al Mar di Marmara?',
'Bosforo',
'Dardanelli',
'Kerč',
'Otranto'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale capitale nazionale è situata sull''isola di Upolu?',
'Apia',
'Suva',
'Nuku''alofa',
'Port Vila'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale fiume sfocia nell''Atlantico presso Saint-Louis, sulla costa dell''Africa occidentale?',
'Senegal',
'Niger',
'Gambia',
'Volta'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale territorio continentale sudamericano confina sia con il Suriname sia con il Brasile?',
'Guyana francese',
'Guyana',
'Uruguay',
'Ecuador'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale catena montuosa culmina nel Toubkal?',
'Atlante',
'Ruwenzori',
'Drakensberg',
'Hoggar'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale isola dell''Indonesia ospita la città di Makassar?',
'Sulawesi',
'Giava',
'Bali',
'Lombok'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale lago asiatico è il più profondo del mondo?',
'Bajkal',
'Balqaš',
'Issyk-Kul',
'Lago d''Aral'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale paese possiede l''exclave di Cabinda?',
'Angola',
'Gabon',
'Camerun',
'Mozambico'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale fiume europeo sfocia nel Mare del Nord presso Rotterdam dopo essersi ramificato nel suo delta?',
'Reno',
'Elba',
'Weser',
'Oder'
),

(
(SELECT id FROM categorie WHERE nome = 'Geografia'),
'difficile',
'Quale isola canadese è separata dalla Groenlandia dallo stretto di Nares?',
'Ellesmere',
'Baffin',
'Victoria',
'Banks'
);

INSERT INTO domande (
    categoria_id,
    difficolta,
    domanda,
    risposta_corretta,
    risposta_errata_1,
    risposta_errata_2,
    risposta_errata_3
)
VALUES

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Qual è il pianeta più vicino al Sole?',
'Mercurio',
'Venere',
'Marte',
'Terra'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Qual è il pianeta più grande del Sistema Solare?',
'Giove',
'Saturno',
'Terra',
'Urano'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Qual è il gas più abbondante nell''atmosfera terrestre?',
'Azoto',
'Ossigeno',
'Anidride carbonica',
'Idrogeno'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale organo pompa il sangue nel corpo umano?',
'Cuore',
'Polmone',
'Fegato',
'Rene'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Qual è la formula chimica dell''acqua?',
'H₂O',
'CO₂',
'O₂',
'NaCl'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Chi formulò la teoria della relatività?',
'Albert Einstein',
'Isaac Newton',
'Galileo Galilei',
'Charles Darwin'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale pianeta è conosciuto come Pianeta Rosso?',
'Marte',
'Venere',
'Giove',
'Mercurio'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale scienziato propose la teoria dell''evoluzione per selezione naturale?',
'Charles Darwin',
'Gregor Mendel',
'Louis Pasteur',
'Stephen Hawking'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Qual è l''unità di misura della temperatura nel Sistema Internazionale?',
'Kelvin',
'Grado Celsius',
'Fahrenheit',
'Joule'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale forza ci mantiene sulla superficie terrestre?',
'Gravità',
'Magnetismo',
'Attrito',
'Energia cinetica'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale particella ha carica elettrica negativa?',
'Elettrone',
'Protone',
'Neutrone',
'Fotone'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale organo permette la respirazione?',
'Polmoni',
'Cuore',
'Stomaco',
'Pancreas'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Qual è il simbolo chimico dell''oro?',
'Au',
'Ag',
'Fe',
'O'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quanti pianeti ci sono nel Sistema Solare?',
'8',
'7',
'9',
'10'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale legge fisica descrive la relazione tra forza, massa e accelerazione?',
'Seconda legge di Newton',
'Legge di Boyle',
'Principio di Archimede',
'Legge di Ohm'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale vitamina viene prodotta dal corpo grazie all''esposizione al Sole?',
'Vitamina D',
'Vitamina C',
'Vitamina A',
'Vitamina B12'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale parte della cellula contiene il DNA?',
'Nucleo',
'Citoplasma',
'Membrana cellulare',
'Mitocondrio'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale animale è un mammifero?',
'Delfino',
'Squalo',
'Polpo',
'Tartaruga'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Qual è il nome del processo con cui le piante producono energia dalla luce?',
'Fotosintesi clorofilliana',
'Respirazione cellulare',
'Fermentazione',
'Digestione'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Qual è il satellite naturale della Terra?',
'Luna',
'Marte',
'Europa',
'Titano'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale scienziato scoprì la legge della gravitazione universale?',
'Isaac Newton',
'Albert Einstein',
'Nikola Tesla',
'Copernico'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Qual è il materiale genetico degli esseri viventi?',
'DNA',
'RNA messaggero',
'Proteina',
'Glucosio'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale pianeta possiede gli anelli più evidenti?',
'Saturno',
'Giove',
'Urano',
'Nettuno'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Qual è l''organo principale del sistema nervoso?',
'Cervello',
'Cuore',
'Fegato',
'Polmone'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale elemento chimico ha simbolo Fe?',
'Ferro',
'Oro',
'Argento',
'Rame'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale animale è noto come il più grande mammifero vivente?',
'Balena azzurra',
'Elefante africano',
'Orca',
'Giraffa'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale teoria descrive l''origine dell''universo attraverso una grande espansione iniziale?',
'Big Bang',
'Teoria delle stringhe',
'Geocentrismo',
'Evoluzione'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale strumento misura la temperatura?',
'Termometro',
'Barometro',
'Anemometro',
'Microscopio'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale scienziato è considerato il padre della genetica?',
'Gregor Mendel',
'Darwin',
'Watson',
'Pasteur'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale gas è necessario per la respirazione umana?',
'Ossigeno',
'Azoto',
'Elio',
'Metano'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale particella elementare è responsabile dell''interazione forte tra i quark?',
'Gluone',
'Fotone',
'Bosone W',
'Gravitone'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale astronomo formulò le tre leggi sul moto dei pianeti?',
'Johannes Kepler',
'Tycho Brahe',
'Niccolò Copernico',
'Galileo Galilei'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale scala misura la durezza dei minerali?',
'Scala di Mohs',
'Scala Richter',
'Scala Mercalli',
'Scala Beaufort'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale organello cellulare è sede principale della respirazione cellulare?',
'Mitocondrio',
'Apparato di Golgi',
'Lisosoma',
'Reticolo endoplasmatico'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale elemento chimico possiede il simbolo W?',
'Tungsteno',
'Titanio',
'Stagno',
'Vanadio'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale missione spaziale portò per la prima volta un rover su Marte nel 1997?',
'Mars Pathfinder',
'Viking 1',
'Spirit',
'Curiosity'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale enzima sintetizza una molecola di RNA usando il DNA come stampo?',
'RNA polimerasi',
'DNA polimerasi',
'Ribosoma',
'Trascrittasi inversa'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale unità derivata del Sistema Internazionale misura l''attività catalitica?',
'Katal',
'Becquerel',
'Siemens',
'Weber'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale scienziato propose il principio di indeterminazione?',
'Werner Heisenberg',
'Erwin Schrödinger',
'Max Planck',
'Niels Bohr'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Attorno a quale pianeta del Sistema Solare orbita Titano?',
'Saturno',
'Giove',
'Urano',
'Nettuno'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale tipo di legame chimico si forma mediante la condivisione di elettroni?',
'Legame covalente',
'Legame ionico',
'Legame metallico',
'Legame idrogeno'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale biologo introdusse la nomenclatura binomiale delle specie?',
'Carlo Linneo',
'Gregor Mendel',
'Jean-Baptiste Lamarck',
'Charles Darwin'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale stella è la più vicina al Sole dopo quest''ultimo?',
'Proxima Centauri',
'Sirio',
'Alpha Centauri A',
'Barnard'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale fenomeno provoca l''aurora boreale?',
'L''interazione tra vento solare e campo magnetico terrestre',
'La rifrazione della luce lunare',
'L''attività vulcanica',
'La riflessione della luce sulle nubi'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale fisico ricevette il Premio Nobel per la scoperta dell''effetto fotoelettrico?',
'Albert Einstein',
'Max Planck',
'Ernest Rutherford',
'Paul Dirac'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale passaggio di stato trasforma un liquido in un solido?',
'Solidificazione',
'Sublimazione',
'Condensazione',
'Vaporizzazione'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale strumento misura la pressione atmosferica?',
'Barometro',
'Anemometro',
'Igrometro',
'Pluviometro'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale metallo è liquido a circa 20 °C e alla pressione atmosferica?',
'Mercurio',
'Alluminio',
'Rame',
'Stagno'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale gruppo di vertebrati comprende rane e salamandre?',
'Anfibi',
'Rettili',
'Pesci',
'Mammiferi'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale parte del fiore produce il polline?',
'Antera',
'Stigma',
'Ovario',
'Sepalo'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Come si chiama il percorso compiuto da un pianeta attorno a una stella?',
'Orbita',
'Asse',
'Diametro',
'Meridiano'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale materiale è normalmente un buon conduttore elettrico?',
'Rame',
'Gomma',
'Vetro',
'Porcellana'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale fenomeno fa apparire piegata una cannuccia immersa nell''acqua?',
'Rifrazione',
'Diffrazione',
'Interferenza',
'Polarizzazione'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale animale appartiene agli aracnidi?',
'Scorpione',
'Formica',
'Millepiedi',
'Granchio'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'facile',
'Quale grandezza si misura in hertz?',
'Frequenza',
'Energia',
'Potenza',
'Pressione'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale base azotata è presente nell''RNA al posto della timina?',
'Uracile',
'Adenina',
'Guanina',
'Citosina'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale legge lega tensione, corrente e resistenza in un conduttore ohmico?',
'Legge di Ohm',
'Legge di Hooke',
'Legge di Coulomb',
'Legge di Boyle'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale roccia deriva dalla trasformazione metamorfica del calcare?',
'Marmo',
'Basalto',
'Granito',
'Arenaria'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale struttura della cellula vegetale contiene clorofilla?',
'Cloroplasto',
'Lisosoma',
'Ribosoma',
'Centriolo'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Che cosa rappresenta il numero atomico di un elemento?',
'Il numero di protoni nel nucleo',
'Il numero di neutroni nel nucleo',
'La somma di protoni e neutroni',
'Il numero di legami possibili'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale processo porta alla formazione di gameti con metà dei cromosomi nelle specie diploidi?',
'Meiosi',
'Mitosi',
'Scissione binaria',
'Gemmazione'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale tipo di onda è il suono che si propaga nell''aria?',
'Meccanica longitudinale',
'Elettromagnetica trasversale',
'Elettromagnetica longitudinale',
'Meccanica esclusivamente trasversale'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale gas nobile viene comunemente usato per gonfiare palloncini che salgono nell''aria?',
'Elio',
'Argon',
'Neon',
'Xenon'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale pianeta ha un asse di rotazione inclinato di circa 98 gradi, tanto da sembrare coricato?',
'Urano',
'Nettuno',
'Giove',
'Venere'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'medio',
'Quale grandezza fisica si conserva in un sistema isolato durante un urto, anche anelastico?',
'Quantità di moto totale',
'Energia cinetica totale',
'Velocità di ogni corpo',
'Temperatura di ogni corpo'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale principio afferma che due fermioni identici non possono occupare lo stesso stato quantico?',
'Principio di esclusione di Pauli',
'Principio di Huygens',
'Principio di Fermat',
'Principio di equivalenza'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale ciclo metabolico fissa il carbonio durante la fotosintesi?',
'Ciclo di Calvin',
'Ciclo di Krebs',
'Ciclo dell''urea',
'Ciclo di Cori'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale minerale occupa il grado 8 nella scala di Mohs?',
'Topazio',
'Quarzo',
'Corindone',
'Apatite'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale legge descrive lo spostamento del massimo di emissione di un corpo nero al variare della temperatura?',
'Legge di Wien',
'Legge di Pascal',
'Legge di Fick',
'Legge di Faraday'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale numero quantico descrive l''orientamento spaziale di un orbitale atomico?',
'Numero quantico magnetico',
'Numero quantico principale',
'Numero quantico di spin',
'Numero quantico azimutale'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale enzima unisce frammenti adiacenti di DNA formando legami fosfodiesterici?',
'DNA ligasi',
'Elicasi',
'Primasi',
'Topoisomerasi'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale discontinuità separa la crosta terrestre dal mantello?',
'Discontinuità di Mohorovičić',
'Discontinuità di Gutenberg',
'Discontinuità di Lehmann',
'Limite di Roche'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale particella mediatrice dell''interazione debole può avere carica elettrica positiva?',
'Bosone W⁺',
'Bosone Z⁰',
'Fotone',
'Gluone'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale fenomeno quantistico permette di attraversare una barriera energetica classicamente insuperabile?',
'Effetto tunnel',
'Effetto Doppler',
'Effetto Joule',
'Effetto Coriolis'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale gruppo di organismi comprende i metanogeni, capaci di produrre metano nel proprio metabolismo?',
'Archei',
'Funghi',
'Piante',
'Animali'
);

INSERT INTO domande (
    categoria_id,
    difficolta,
    domanda,
    risposta_corretta,
    risposta_errata_1,
    risposta_errata_2,
    risposta_errata_3
)
VALUES

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quanti giocatori compongono una squadra di calcio in campo?',
'11',
'9',
'10',
'12'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale Paese ha vinto il Mondiale di calcio 2022?',
'Argentina',
'Francia',
'Brasile',
'Germania'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'In quale sport si utilizza una racchetta e una pallina gialla?',
'Tennis',
'Basket',
'Golf',
'Baseball'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Chi è soprannominato "La Pulce" nel calcio?',
'Lionel Messi',
'Cristiano Ronaldo',
'Neymar',
'Kylian Mbappé'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale atleta giamaicano è famoso per i record nei 100 e 200 metri?',
'Usain Bolt',
'Carl Lewis',
'Mo Farah',
'Michael Johnson'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quanti punti vale nel basket un canestro realizzato oltre la linea dell''arco?',
'3',
'2',
'1',
'4'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale squadra di calcio gioca allo stadio Santiago Bernabéu?',
'Real Madrid',
'Barcellona',
'Atletico Madrid',
'Valencia'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale tennista è diventato nel 2023 il primo uomo a vincere 24 titoli del Grande Slam in singolare?',
'Novak Djokovic',
'Roger Federer',
'Rafael Nadal',
'Andy Murray'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'In quale sport si disputa il Tour de France?',
'Ciclismo',
'Automobilismo',
'Atletica',
'Nuoto'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Qual è lo sport nazionale giapponese tradizionale?',
'Sumo',
'Karate',
'Judo',
'Kendo'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale pilota britannico ha vinto sette titoli mondiali di Formula 1?',
'Lewis Hamilton',
'Fernando Alonso',
'Ayrton Senna',
'Sebastian Vettel'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale sport si pratica a Wimbledon?',
'Tennis',
'Calcio',
'Golf',
'Rugby'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quanti anelli ha il simbolo olimpico?',
'5',
'4',
'6',
'7'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale nazionale ha conquistato cinque Coppe del Mondo di calcio tra il 1958 e il 2002?',
'Brasile',
'Italia',
'Germania',
'Argentina'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Per quale sport è celebre soprattutto Michael Jordan?',
'Basket',
'Baseball',
'Golf',
'Tennis'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale squadra italiana gioca allo stadio San Siro insieme al Milan?',
'Inter',
'Juventus',
'Roma',
'Napoli'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale sport utilizza una rete e una palla che deve essere colpita con le mani?',
'Pallavolo',
'Pallanuoto',
'Rugby',
'Hockey'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Chi ha vinto più Palloni d''Oro nella storia del calcio fino al 2023?',
'Lionel Messi',
'Cristiano Ronaldo',
'Michel Platini',
'Johan Cruijff'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'In quale sport si usa il termine "fuori campo" o "home run"?',
'Baseball',
'Calcio',
'Tennis',
'Cricket'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale Paese ha ospitato le Olimpiadi estive 2016?',
'Brasile',
'Giappone',
'Regno Unito',
'Cina'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale tennista spagnolo è famoso sulla terra rossa del Roland Garros?',
'Rafael Nadal',
'Carlos Alcaraz',
'David Ferrer',
'Manuel Orantes'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Per quale disciplina motociclistica è celebre Valentino Rossi?',
'MotoGP',
'Formula 1',
'Rally',
'Sci'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale squadra NBA ha come simbolo un trifoglio verde?',
'Boston Celtics',
'Los Angeles Lakers',
'Chicago Bulls',
'Miami Heat'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quanti tempi regolamentari ci sono in una partita di calcio?',
'2',
'3',
'4',
'1'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale atleta italiano ha vinto l''oro olimpico nei 100 metri a Tokyo 2020?',
'Marcell Jacobs',
'Gianmarco Tamberi',
'Filippo Tortu',
'Usain Bolt'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'A quale sport appartiene la Copa América organizzata dalla CONMEBOL?',
'Calcio',
'Basket',
'Tennis',
'Rugby'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale club deteneva nel 2024 il record di 15 vittorie nella Coppa dei Campioni/Champions League?',
'Real Madrid',
'Milan',
'Liverpool',
'Bayern Monaco'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale sport si pratica sul ghiaccio con pattini e bastoni?',
'Hockey su ghiaccio',
'Curling',
'Sci alpino',
'Biathlon'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale pugile è conosciuto con il soprannome "The Greatest"?',
'Muhammad Ali',
'Mike Tyson',
'Floyd Mayweather',
'Rocky Marciano'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale sport si pratica con una tavola e le onde del mare?',
'Surf',
'Snowboard',
'Sci',
'Skateboard'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale città ospitò i primi Giochi Olimpici invernali della storia nel 1924?',
'Chamonix',
'Sankt Moritz',
'Oslo',
'Garmisch-Partenkirchen'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Nel rugby a 15, quanti punti vale una meta prima della trasformazione?',
'5',
'4',
'6',
'7'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale golfista è soprannominato "The Golden Bear"?',
'Jack Nicklaus',
'Arnold Palmer',
'Gary Player',
'Tom Watson'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale schermitore italiano vinse sei medaglie d''oro olimpiche nella carriera?',
'Edoardo Mangiarotti',
'Nedo Nadi',
'Valentina Vezzali',
'Aldo Montano'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale disciplina sarà sostituita dalla corsa a ostacoli nel pentathlon moderno dei Giochi di Los Angeles 2028?',
'Equitazione',
'Scherma',
'Nuoto',
'Laser run'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Nel baseball, come viene chiamata una partita perfetta lanciata da un pitcher?',
'Perfect Game',
'Grand Slam',
'No-Hitter',
'Complete Game'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale tennista è stata la prima nella storia a completare il cosiddetto "Golden Slam" nello stesso anno solare?',
'Steffi Graf',
'Martina Navrátilová',
'Serena Williams',
'Monica Seles'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale squadra vinse la primissima Coppa dei Campioni UEFA nel 1956?',
'Real Madrid',
'Milan',
'Stade de Reims',
'Benfica'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'In quale sport si assegna il trofeo chiamato America''s Cup?',
'Vela',
'Canottaggio',
'Nuoto',
'Motonautica'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale ciclista è ricordato come il primo vincitore di tutti e tre i Grandi Giri?',
'Jacques Anquetil',
'Eddy Merckx',
'Felice Gimondi',
'Bernard Hinault'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Nel judo, quale grado corrisponde tradizionalmente alla cintura nera di primo livello?',
'1º Dan',
'5º Kyu',
'3º Dan',
'10º Dan'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale nazione ha inventato il curling moderno?',
'Scozia',
'Canada',
'Svezia',
'Norvegia'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'In Formula 1, quale circuito è noto come "Tempio della Velocità"?',
'Monza',
'Spa-Francorchamps',
'Silverstone',
'Suzuka'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale disciplina olimpica comprende le prove di lead, boulder e speed?',
'Arrampicata sportiva',
'Parkour',
'Alpinismo',
'Orienteering'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale pugile fu il primo a riconquistare tre volte il titolo mondiale dei pesi massimi?',
'Muhammad Ali',
'Joe Frazier',
'Larry Holmes',
'George Foreman'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'In quale disciplina si gareggia con fioretto, spada e sciabola?',
'Scherma',
'Pentathlon dei lanci',
'Tiro con l''arco',
'Kendo'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale competizione ciclistica assegna al leader della classifica generale la maglia rosa?',
'Giro d''Italia',
'Vuelta a España',
'Giro di Svizzera',
'Parigi-Nizza'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale attrezzo viene passato tra compagni nelle staffette di atletica?',
'Testimone',
'Disco',
'Giavellotto',
'Martello'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale stile di nuoto prevede che l''atleta proceda con il viso rivolto verso l''alto?',
'Dorso',
'Rana',
'Farfalla',
'Crawl'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale sport utilizza un volano al posto della palla?',
'Badminton',
'Squash',
'Padel',
'Tennis tavolo'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quanti chilometri misura ufficialmente una maratona?',
'42,195',
'40',
'41,195',
'45'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale nazione rappresentava Federica Pellegrini nelle competizioni internazionali?',
'Italia',
'Francia',
'Svizzera',
'Spagna'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'In quale disciplina si eseguono esercizi agli anelli?',
'Ginnastica artistica',
'Ginnastica ritmica',
'Trampolino elastico',
'Tuffi'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale sport combina sci di fondo e tiro con la carabina?',
'Biathlon',
'Combinata nordica',
'Sci alpinismo',
'Pentathlon moderno'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale superficie caratterizza tradizionalmente gli incontri di Wimbledon?',
'Erba',
'Terra rossa',
'Cemento',
'Parquet'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale atleta vinse quattro ori nell''atletica ai Giochi di Berlino del 1936?',
'Jesse Owens',
'Carl Lewis',
'Paavo Nurmi',
'Emil Zátopek'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale squadra vinse il campionato NBA del 1996 con Michael Jordan?',
'Chicago Bulls',
'Los Angeles Lakers',
'Detroit Pistons',
'Houston Rockets'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale pilota conquistò il Mondiale di Formula 1 del 2007?',
'Kimi Räikkönen',
'Fernando Alonso',
'Felipe Massa',
'Lewis Hamilton'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale nazionale vinse il primo Mondiale maschile di calcio nel 1930?',
'Uruguay',
'Argentina',
'Italia',
'Brasile'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale tennista italiana vinse il singolare femminile del Roland Garros nel 2010?',
'Francesca Schiavone',
'Flavia Pennetta',
'Sara Errani',
'Roberta Vinci'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quante discipline compongono il decathlon di atletica leggera?',
'Dieci',
'Sette',
'Otto',
'Dodici'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Nel golf, come si chiama una buca completata con un colpo in meno del par?',
'Birdie',
'Bogey',
'Eagle',
'Albatross'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale città ospitò i Giochi olimpici estivi del 1992?',
'Barcellona',
'Atlanta',
'Seul',
'Sydney'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale paese vinse la Coppa del Mondo maschile di rugby nel 1995?',
'Sudafrica',
'Nuova Zelanda',
'Australia',
'Inghilterra'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Nel tennis, quale termine indica un servizio valido che l''avversario non riesce a toccare?',
'Ace',
'Let',
'Break',
'Smash'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale atleta vinse i 5000 metri, i 10000 metri e la maratona ai Giochi del 1952?',
'Emil Zátopek',
'Lasse Virén',
'Abebe Bikila',
'Alain Mimoun'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale squadra di Formula 1 conquistò entrambi i titoli mondiali nel 2009?',
'Brawn GP',
'Red Bull Racing',
'McLaren',
'Ferrari'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale atleta stabilì a Città del Messico 1968 il record mondiale del salto in lungo con 8,90 metri?',
'Bob Beamon',
'Mike Powell',
'Ralph Boston',
'Carl Lewis'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale ciclista vinse il Tour de France del 1998?',
'Marco Pantani',
'Jan Ullrich',
'Bjarne Riis',
'Miguel Indurain'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale paese vinse il torneo olimpico maschile di pallacanestro ad Atene 2004?',
'Argentina',
'Stati Uniti',
'Italia',
'Spagna'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale nuotatrice vinse cinque ori e un argento ai campionati mondiali di Berlino del 1978?',
'Tracy Caulkins',
'Shirley Babashoff',
'Kornelia Ender',
'Janet Evans'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale tennista vinse il singolare maschile di Wimbledon nel 2001 entrando con una wild card?',
'Goran Ivanišević',
'Pat Rafter',
'Lleyton Hewitt',
'Richard Krajicek'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale scacchista sconfisse Boris Spasskij nel match mondiale di Reykjavík del 1972?',
'Bobby Fischer',
'Anatolij Karpov',
'Garri Kasparov',
'Michail Tal'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale nazione vinse la prima Coppa del Mondo femminile di calcio nel 1991?',
'Stati Uniti',
'Norvegia',
'Germania',
'Cina'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'difficile',
'Quale atleta italiana vinse l''oro olimpico nel salto in alto a Mosca 1980?',
'Sara Simeoni',
'Antonella Bevilacqua',
'Alessia Trost',
'Antonietta Di Martino'
);

INSERT INTO domande (
    categoria_id,
    difficolta,
    domanda,
    risposta_corretta,
    risposta_errata_1,
    risposta_errata_2,
    risposta_errata_3
)
VALUES

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Chi ha diretto il film Titanic del 1997?',
'James Cameron',
'Steven Spielberg',
'Christopher Nolan',
'Ridley Scott'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale film contiene la frase "Che la Forza sia con te"?',
'Star Wars',
'Il Signore degli Anelli',
'Matrix',
'Avatar'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale attore interpreta Jack Sparrow nella saga Pirati dei Caraibi?',
'Johnny Depp',
'Tom Cruise',
'Brad Pitt',
'Leonardo DiCaprio'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale film d''animazione racconta la storia di Simba?',
'Il Re Leone',
'Aladdin',
'Frozen',
'Tarzan'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Chi ha diretto il film Inception?',
'Christopher Nolan',
'Quentin Tarantino',
'Martin Scorsese',
'James Cameron'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale premio viene assegnato dall''Academy di Hollywood?',
'Oscar',
'Grammy',
'Emmy',
'Golden Globe'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Chi interpreta il personaggio di Iron Man nel Marvel Cinematic Universe?',
'Robert Downey Jr.',
'Chris Evans',
'Chris Hemsworth',
'Mark Ruffalo'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale film racconta la storia di un giovane mago chiamato Harry?',
'Harry Potter',
'Il Signore degli Anelli',
'Eragon',
'Stardust'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Chi ha diretto Pulp Fiction?',
'Quentin Tarantino',
'Francis Ford Coppola',
'Alfred Hitchcock',
'Stanley Kubrick'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale personaggio è interpretato da Sylvester Stallone nella saga Rocky?',
'Rocky Balboa',
'Rambo',
'John McClane',
'Terminator'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale film vinse l''Oscar come miglior film nel 1998 ed è ambientato in parte su una nave?',
'Titanic',
'Avatar',
'Gladiator',
'The Matrix'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Chi interpreta il personaggio di Spider-Man nel film del Marvel Cinematic Universe dal 2016?',
'Tom Holland',
'Tobey Maguire',
'Andrew Garfield',
'Chris Pratt'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale regista ha realizzato il film E.T. l''extraterrestre?',
'Steven Spielberg',
'George Lucas',
'Tim Burton',
'Peter Jackson'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale film contiene il personaggio Darth Vader?',
'Star Wars',
'Jurassic Park',
'Avatar',
'Interstellar'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Chi ha diretto Il Padrino?',
'Francis Ford Coppola',
'Martin Scorsese',
'Brian De Palma',
'Woody Allen'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale attore interpreta Jack Dawson in Titanic?',
'Leonardo DiCaprio',
'Brad Pitt',
'Matt Damon',
'Christian Bale'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale film di fantascienza è ambientato su Pandora?',
'Avatar',
'Interstellar',
'Blade Runner',
'Dune'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale personaggio è un archeologo protagonista di una famosa saga cinematografica?',
'Indiana Jones',
'James Bond',
'Rocky Balboa',
'John Wick'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Chi ha diretto il film La vita è bella?',
'Roberto Benigni',
'Federico Fellini',
'Giuseppe Tornatore',
'Paolo Sorrentino'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale saga cinematografica iniziata nel 2003 ha come protagonista la guerriera vampira Selene?',
'Underworld',
'Twilight',
'Blade',
'Dracula'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale attore interpreta il Joker nel film del 2019?',
'Joaquin Phoenix',
'Heath Ledger',
'Jack Nicholson',
'Jared Leto'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale film Pixar parla di emozioni dentro la mente di una bambina?',
'Inside Out',
'Cars',
'Up',
'Ratatouille'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale regista ha diretto Il Signore degli Anelli?',
'Peter Jackson',
'George Lucas',
'Ridley Scott',
'James Cameron'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale attore interpreta Neo in Matrix?',
'Keanu Reeves',
'Hugh Jackman',
'Christian Bale',
'Will Smith'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale film di Stanley Kubrick è ambientato nello spazio?',
'2001: Odissea nello spazio',
'Arancia Meccanica',
'Shining',
'Full Metal Jacket'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale attrice interpreta Hermione nella saga Harry Potter?',
'Emma Watson',
'Emma Stone',
'Natalie Portman',
'Keira Knightley'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale film racconta la storia di un gladiatore romano interpretato da Russell Crowe?',
'Il Gladiatore',
'Troy',
'Spartacus',
'Ben-Hur'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale personaggio cinematografico è un agente segreto britannico con licenza di uccidere?',
'James Bond',
'Ethan Hunt',
'Jason Bourne',
'Jack Ryan'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale regista italiano ha diretto La dolce vita?',
'Federico Fellini',
'Vittorio De Sica',
'Michelangelo Antonioni',
'Pier Paolo Pasolini'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale film d''animazione racconta la storia di una famiglia di supereroi?',
'Gli Incredibili',
'Shrek',
'Madagascar',
'Kung Fu Panda'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale film di Akira Kurosawa ispirò direttamente il western "Per un pugno di dollari"?',
'La sfida del samurai (Yojimbo)',
'I sette samurai',
'Rashomon',
'Kagemusha'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale regista vinse l''Oscar per il film "The Departed - Il bene e il male"?',
'Martin Scorsese',
'Clint Eastwood',
'Steven Spielberg',
'Ridley Scott'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale film è stato il primo in lingua non inglese a vincere l''Oscar come Miglior Film?',
'Parasite',
'Amour',
'Roma',
'La vita è bella'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Chi compose la colonna sonora del film "C''era una volta il West"?',
'Ennio Morricone',
'Nino Rota',
'John Williams',
'Nicola Piovani'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale film di Stanley Kubrick fu liberamente ispirato al romanzo "Red Alert" di Peter George?',
'Il dottor Stranamore - Ovvero: come imparai a non preoccuparmi e ad amare la bomba',
'2001: Odissea nello spazio',
'Arancia meccanica',
'Full Metal Jacket'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale movimento cinematografico italiano è associato a registi come Rossellini, De Sica e Visconti?',
'Neorealismo',
'Nouvelle Vague',
'Espressionismo',
'Dogma 95'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale attrice interpretò Clarice Starling ne "Il silenzio degli innocenti"?',
'Jodie Foster',
'Glenn Close',
'Susan Sarandon',
'Jessica Lange'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale regista firmò il film "Memento" del 2000?',
'Christopher Nolan',
'David Fincher',
'Darren Aronofsky',
'Denis Villeneuve'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale film di Ingmar Bergman è celebre per la partita a scacchi con la Morte?',
'Il settimo sigillo',
'Persona',
'Il posto delle fragole',
'Sussurri e grida'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale film vinse l''Oscar come Miglior Film battendo "Salvate il soldato Ryan" nel 1999?',
'Shakespeare in Love',
'La sottile linea rossa',
'Elizabeth',
'La vita è bella'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Chi interpretò il ruolo di Vito Corleone ne "Il padrino" del 1972?',
'Marlon Brando',
'Al Pacino',
'Robert De Niro',
'James Caan'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale regista è considerato il principale esponente della Nouvelle Vague francese con il film "Fino all''ultimo respiro"?',
'Jean-Luc Godard',
'François Truffaut',
'Éric Rohmer',
'Claude Chabrol'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale film di Ridley Scott vinse l''Oscar come Miglior Film nel 2001?',
'Il gladiatore',
'Black Hawk Down',
'Hannibal',
'Thelma & Louise'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale attrice ha interpretato la Regina Elisabetta II nel film "The Queen" (2006)?',
'Helen Mirren',
'Judi Dench',
'Olivia Colman',
'Emma Thompson'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale regista italiano vinse l''Oscar come Miglior regista per "L''ultimo imperatore"?',
'Bernardo Bertolucci',
'Federico Fellini',
'Michelangelo Antonioni',
'Giuseppe Tornatore'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale attore interpreta Forrest Gump nel film del 1994?',
'Tom Hanks',
'Robin Williams',
'Kevin Costner',
'Harrison Ford'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'In quale saga Marty McFly viaggia nel tempo a bordo di una DeLorean?',
'Ritorno al futuro',
'Men in Black',
'Ghostbusters',
'Jurassic Park'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale regista diresse Jurassic Park nel 1993?',
'Steven Spielberg',
'George Lucas',
'Robert Zemeckis',
'James Cameron'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale film Disney del 1964 ha come protagonista una tata che vola con un ombrello?',
'Mary Poppins',
'Pomi d''ottone e manici di scopa',
'Il maggiolino tutto matto',
'Pollyanna'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale attrice interpreta il ruolo principale in Pretty Woman?',
'Julia Roberts',
'Sandra Bullock',
'Meg Ryan',
'Michelle Pfeiffer'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale premio principale viene assegnato alla Mostra del cinema di Venezia?',
'Leone d''oro',
'Palma d''oro',
'Orso d''oro',
'Concha d''oro'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale film del 1975 racconta gli attacchi di un grande predatore marino presso l''isola di Amity?',
'Lo squalo',
'Orca - L''orca assassina',
'Abissi',
'Blu profondo'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale attore interpretò il personaggio di Fantozzi al cinema?',
'Paolo Villaggio',
'Alberto Sordi',
'Nino Manfredi',
'Ugo Tognazzi'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale film del 1982 ha per protagonista il cacciatore di replicanti Rick Deckard?',
'Blade Runner',
'Tron',
'Alien',
'Dune'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'facile',
'Quale attrice interpreta Katniss Everdeen nei film di Hunger Games?',
'Jennifer Lawrence',
'Emma Stone',
'Shailene Woodley',
'Kristen Stewart'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale regista diresse Psycho nel 1960?',
'Alfred Hitchcock',
'Orson Welles',
'Billy Wilder',
'John Ford'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale film italiano del 1988 ha come protagonista un ragazzo soprannominato Totò e un proiezionista di nome Alfredo?',
'Nuovo Cinema Paradiso',
'Mediterraneo',
'Il postino',
'Pane e tulipani'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale regista diresse Amélie, uscito nel 2001?',
'Jean-Pierre Jeunet',
'Luc Besson',
'François Ozon',
'Michel Gondry'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'In quale film Charlize Theron interpreta Imperator Furiosa?',
'Mad Max: Fury Road',
'Atomic Blonde',
'The Old Guard',
'Prometheus'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale regista diresse il western Il buono, il brutto, il cattivo?',
'Sergio Leone',
'Sergio Corbucci',
'Sam Peckinpah',
'John Sturges'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale attore interpreta Truman Burbank in The Truman Show?',
'Jim Carrey',
'Ben Stiller',
'Adam Sandler',
'Steve Carell'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale film di Charlie Chaplin critica la catena di montaggio e l''alienazione industriale?',
'Tempi moderni',
'Luci della città',
'La febbre dell''oro',
'Il monello'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale regista diresse il film La finestra di fronte del 2003?',
'Ferzan Özpetek',
'Nanni Moretti',
'Paolo Sorrentino',
'Gabriele Salvatores'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale attrice interpreta Mia Wallace in Pulp Fiction?',
'Uma Thurman',
'Rosanna Arquette',
'Patricia Arquette',
'Bridget Fonda'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'medio',
'Quale film del 2016 racconta l''incontro della linguista Louise Banks con visitatori extraterrestri?',
'Arrival',
'Interstellar',
'Gravity',
'Ad Astra'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale direttrice della fotografia divenne nel 2018 la prima donna candidata all''Oscar per la fotografia, grazie a Mudbound?',
'Rachel Morrison',
'Ellen Kuras',
'Mandy Walker',
'Reed Morano'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale regista realizzò Tokyo Story, noto in Italia come Viaggio a Tokyo, nel 1953?',
'Yasujirō Ozu',
'Kenji Mizoguchi',
'Akira Kurosawa',
'Mikio Naruse'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale film di Agnès Varda segue una cantante per due ore, in attesa di un referto medico?',
'Cléo dalle 5 alle 7',
'Senza tetto né legge',
'Il verde prato dell''amore',
'Una canta, l''altra no'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale direttore della fotografia collaborò con Vittorio De Sica a Ladri di biciclette?',
'Carlo Montuori',
'Gianni Di Venanzo',
'Aldo Tonti',
'Otello Martelli'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale film di Fritz Lang del 1927 presenta una città futuristica divisa tra operai e dirigenti?',
'Metropolis',
'M - Il mostro di Düsseldorf',
'La donna sulla Luna',
'Il dottor Mabuse'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale regista senegalese realizzò La Noire de... nel 1966?',
'Ousmane Sembène',
'Djibril Diop Mambéty',
'Souleymane Cissé',
'Abderrahmane Sissako'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale montatrice lavorò con Martin Scorsese a Toro scatenato?',
'Thelma Schoonmaker',
'Dede Allen',
'Anne V. Coates',
'Verna Fields'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale film del 1943 segnò l''esordio di Luchino Visconti nella regia di un lungometraggio?',
'Ossessione',
'La terra trema',
'Bellissima',
'Senso'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale regista iraniano vinse la Palma d''oro nel 1997 con Il sapore della ciliegia?',
'Abbas Kiarostami',
'Jafar Panahi',
'Mohsen Makhmalbaf',
'Asghar Farhadi'
),

(
(SELECT id FROM categorie WHERE nome = 'Cinema'),
'difficile',
'Quale compositore scrisse la musica di Vertigo, distribuito in Italia come La donna che visse due volte?',
'Bernard Herrmann',
'Max Steiner',
'Miklós Rózsa',
'Dimitri Tiomkin'
);

INSERT INTO domande (
    categoria_id,
    difficolta,
    domanda,
    risposta_corretta,
    risposta_errata_1,
    risposta_errata_2,
    risposta_errata_3
)
VALUES

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Chi è conosciuto come il Re del Pop?',
'Michael Jackson',
'Elvis Presley',
'Freddie Mercury',
'David Bowie'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale strumento possiede generalmente 88 tasti?',
'Pianoforte',
'Violino',
'Chitarra',
'Flauto'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale band ha pubblicato l''album The Dark Side of the Moon?',
'Pink Floyd',
'Queen',
'Beatles',
'Rolling Stones'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Chi ha scritto la canzone Imagine?',
'John Lennon',
'Paul McCartney',
'Bob Dylan',
'Elton John'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale compositore scrisse la Nona Sinfonia che include l''"Inno alla gioia"?',
'Ludwig van Beethoven',
'Wolfgang Amadeus Mozart',
'Johann Sebastian Bach',
'Antonio Vivaldi'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale cantante è famoso per la canzone Thriller?',
'Michael Jackson',
'Prince',
'Sting',
'Bruno Mars'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale gruppo musicale era composto da John Lennon, Paul McCartney, George Harrison e Ringo Starr?',
'The Beatles',
'Queen',
'ABBA',
'U2'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale strumento si suona generalmente con un archetto?',
'Violino',
'Pianoforte',
'Batteria',
'Sassofono'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Chi è l''autore del ciclo di concerti "Le quattro stagioni"?',
'Antonio Vivaldi',
'Mozart',
'Chopin',
'Verdi'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale cantante è noto come "The King of Rock and Roll"?',
'Elvis Presley',
'Chuck Berry',
'Freddie Mercury',
'Johnny Cash'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale cantante dei Queen è famoso per la voce potente e il brano Bohemian Rhapsody?',
'Freddie Mercury',
'Brian May',
'Roger Taylor',
'David Bowie'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale genere musicale nasce principalmente negli Stati Uniti tra fine Ottocento e inizio Novecento?',
'Jazz',
'Opera',
'Metal',
'Reggae'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale artista italiano è famoso per la canzone Nel blu dipinto di blu?',
'Domenico Modugno',
'Lucio Dalla',
'Adriano Celentano',
'Vasco Rossi'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale strumento ha sei corde nella sua forma più comune?',
'Chitarra',
'Violoncello',
'Clarinetto',
'Oboe'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale compositore italiano ha scritto l''opera Aida?',
'Giuseppe Verdi',
'Giacomo Puccini',
'Rossini',
'Donizetti'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale cantante è famoso per il brano Like a Rolling Stone?',
'Bob Dylan',
'Bruce Springsteen',
'Elvis Presley',
'Bono'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale band britannica ha pubblicato l''album Abbey Road?',
'The Beatles',
'Queen',
'Coldplay',
'Pink Floyd'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale strumento appartiene alla famiglia degli strumenti a percussione?',
'Batteria',
'Violino',
'Flauto',
'Tromba'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Chi compose l''opera La traviata?',
'Giuseppe Verdi',
'Puccini',
'Mozart',
'Wagner'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale cantante italiana è conosciuta per la canzone La solitudine?',
'Laura Pausini',
'Giorgia',
'Elisa',
'Annalisa'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale gruppo musicale ha pubblicato We Will Rock You?',
'Queen',
'AC/DC',
'Metallica',
'U2'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale genere musicale è associato principalmente a Bob Marley?',
'Reggae',
'Blues',
'Country',
'Punk'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale compositore è associato al periodo barocco?',
'Johann Sebastian Bach',
'Beethoven',
'Debussy',
'Schubert'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale cantante ha pubblicato l''album 21?',
'Adele',
'Rihanna',
'Beyoncé',
'Taylor Swift'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale strumento suonava principalmente Louis Armstrong?',
'Tromba',
'Sassofono',
'Pianoforte',
'Violino'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale artista è famoso per il personaggio Ziggy Stardust?',
'David Bowie',
'Elton John',
'Prince',
'Sting'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale cantante italiana ha vinto il Festival di Sanremo 2024?',
'Angelina Mango',
'Emma Marrone',
'Elodie',
'Annalisa'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale cantante italiano ha interpretato L''italiano?',
'Toto Cutugno',
'Pooh',
'Nomadi',
'Matia Bazar'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale compositore ha scritto Il flauto magico?',
'Wolfgang Amadeus Mozart',
'Beethoven',
'Haydn',
'Schumann'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale cantante è famoso per il brano Shape of You?',
'Ed Sheeran',
'Justin Bieber',
'Sam Smith',
'Shawn Mendes'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale compositore completò il celebre ciclo operistico "L''Anello del Nibelungo"?',
'Richard Wagner',
'Giuseppe Verdi',
'Richard Strauss',
'Giacomo Puccini'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale compositore scrisse il poema sinfonico "Così parlò Zarathustra"?',
'Richard Strauss',
'Gustav Mahler',
'Anton Bruckner',
'Jean Sibelius'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale musicista è considerato il padre del bebop insieme a Dizzy Gillespie?',
'Charlie Parker',
'John Coltrane',
'Miles Davis',
'Thelonious Monk'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale opera di Mozart racconta la storia del principe Tamino?',
'Il flauto magico',
'Don Giovanni',
'Le nozze di Figaro',
'Così fan tutte'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale compositore è autore delle "Variazioni Goldberg"?',
'Johann Sebastian Bach',
'Georg Friedrich Händel',
'Joseph Haydn',
'Antonio Vivaldi'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale band progressive britannica pubblicò l''album "Close to the Edge" nel 1972?',
'Yes',
'Genesis',
'Emerson, Lake & Palmer',
'Jethro Tull'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Chi compose il celebre "Boléro"?',
'Maurice Ravel',
'Claude Debussy',
'Camille Saint-Saëns',
'Gabriel Fauré'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale pianista jazz pubblicò nel 1961 il leggendario album "Sunday at the Village Vanguard"?',
'Bill Evans',
'Herbie Hancock',
'McCoy Tyner',
'Keith Jarrett'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale gruppo britannico incise l''album "Selling England by the Pound"?',
'Genesis',
'King Crimson',
'Camel',
'Gentle Giant'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Chi compose l''opera "Turandot", rimasta incompiuta alla sua morte?',
'Giacomo Puccini',
'Pietro Mascagni',
'Ruggero Leoncavallo',
'Umberto Giordano'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale violinista italiano fu soprannominato "Il violinista del diavolo"?',
'Niccolò Paganini',
'Arcangelo Corelli',
'Giuseppe Tartini',
'Antonio Vivaldi'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale musicista fondò il gruppo Dire Straits?',
'Mark Knopfler',
'Eric Clapton',
'David Gilmour',
'Peter Gabriel'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale compositore russo scrisse il balletto "L''uccello di fuoco"?',
'Igor Stravinskij',
'Sergej Prokof''ev',
'Dmitrij Šostakovič',
'Nikolaj Rimskij-Korsakov'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale celebre festival musicale si svolse nello stato di New York nell''agosto del 1969?',
'Woodstock',
'Monterey Pop Festival',
'Isle of Wight Festival',
'Live Aid'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale compositore elaborò il metodo dodecafonico basato su una serie di dodici suoni?',
'Arnold Schönberg',
'Igor Stravinskij',
'Claude Debussy',
'Béla Bartók'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale band irlandese ha Bono come cantante?',
'U2',
'Oasis',
'Coldplay',
'Radiohead'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale famiglia di strumenti comprende clarinetto e oboe?',
'Legni',
'Ottoni',
'Archi',
'Percussioni'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale cantante ha pubblicato l''album Born in the U.S.A.?',
'Bruce Springsteen',
'Billy Joel',
'Bryan Adams',
'Sting'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Come si chiama l''esecuzione vocale senza accompagnamento strumentale?',
'A cappella',
'In playback',
'In falsetto',
'In crescendo'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale gruppo svedese ha inciso Dancing Queen?',
'ABBA',
'Roxette',
'Ace of Base',
'Europe'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale segno musicale alza una nota di un semitono?',
'Diesis',
'Bemolle',
'Bequadro',
'Corona'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale cantautore italiano ha pubblicato l''album La voce del padrone?',
'Franco Battiato',
'Lucio Dalla',
'Francesco De Gregori',
'Paolo Conte'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale strumento si suona comprimendo un mantice e azionando tasti o bottoni?',
'Fisarmonica',
'Clavicembalo',
'Marimba',
'Mandolino'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Quale cantante ha interpretato Like a Virgin nel 1984?',
'Madonna',
'Cyndi Lauper',
'Whitney Houston',
'Tina Turner'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'facile',
'Come si chiama il gruppo delle cinque linee su cui si scrivono le note?',
'Pentagramma',
'Battuta',
'Accordo',
'Intervallo'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale band pubblicò Nevermind nel 1991?',
'Nirvana',
'Pearl Jam',
'Soundgarden',
'Alice in Chains'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale compositore scrisse il balletto Il lago dei cigni?',
'Pëtr Il''ič Čajkovskij',
'Sergej Prokof''ev',
'Aleksandr Borodin',
'Nikolaj Rimskij-Korsakov'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale cantante portoghese è stata una delle interpreti più celebri del fado?',
'Amália Rodrigues',
'Cesária Évora',
'Miriam Makeba',
'Mercedes Sosa'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale album di Miles Davis, pubblicato nel 1959, comprende So What?',
'Kind of Blue',
'Bitches Brew',
'Sketches of Spain',
'In a Silent Way'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale band ha pubblicato l''album OK Computer?',
'Radiohead',
'Blur',
'Pulp',
'Muse'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale compositore scrisse l''opera Il barbiere di Siviglia del 1816?',
'Gioachino Rossini',
'Gaetano Donizetti',
'Vincenzo Bellini',
'Giuseppe Verdi'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quanti semitoni comprende un''ottava nel temperamento equabile occidentale?',
'Dodici',
'Sette',
'Dieci',
'Quattordici'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale cantautrice ha pubblicato l''album Blue nel 1971?',
'Joni Mitchell',
'Carole King',
'Joan Baez',
'Carly Simon'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale strumento a tastiera produce il suono pizzicando le corde?',
'Clavicembalo',
'Pianoforte',
'Organo a canne',
'Celesta'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'medio',
'Quale gruppo italiano ha inciso Impressioni di settembre nel 1971?',
'Premiata Forneria Marconi',
'Banco del Mutuo Soccorso',
'Le Orme',
'Area'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale compositore scrisse la Sinfonia Turangalîla?',
'Olivier Messiaen',
'Pierre Boulez',
'Henri Dutilleux',
'Arthur Honegger'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale jazzista pubblicò l''album The Black Saint and the Sinner Lady nel 1963?',
'Charles Mingus',
'Thelonious Monk',
'Ornette Coleman',
'Sonny Rollins'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale compositore è autore del quartetto La morte e la fanciulla?',
'Franz Schubert',
'Robert Schumann',
'Johannes Brahms',
'Felix Mendelssohn'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale intervallo separa le note do e fa diesis ascendenti nella stessa ottava?',
'Quarta aumentata',
'Quarta giusta',
'Quinta giusta',
'Terza maggiore'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale compositore italiano scrisse i madrigali dell''Ottavo libro, detti guerrieri et amorosi?',
'Claudio Monteverdi',
'Carlo Gesualdo',
'Luca Marenzio',
'Giovanni Pierluigi da Palestrina'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale musicista nigeriano contribuì a creare l''afrobeat e guidò gli Africa 70?',
'Fela Kuti',
'Youssou N''Dour',
'Salif Keïta',
'Ali Farka Touré'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale compositore scrisse l''opera Wozzeck?',
'Alban Berg',
'Anton Webern',
'Paul Hindemith',
'Kurt Weill'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale accordatura ha la viola, dalla corda più grave alla più acuta?',
'Do-Sol-Re-La',
'Sol-Re-La-Mi',
'Mi-La-Re-Sol',
'Re-La-Mi-Si'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale compositrice finlandese scrisse l''opera L''Amour de loin?',
'Kaija Saariaho',
'Sofia Gubajdulina',
'Unsuk Chin',
'Judith Weir'
),

(
(SELECT id FROM categorie WHERE nome = 'Musica'),
'difficile',
'Quale producer realizzò con David Byrne l''album My Life in the Bush of Ghosts?',
'Brian Eno',
'Daniel Lanois',
'Trevor Horn',
'Tony Visconti'
);

INSERT INTO domande (
    categoria_id,
    difficolta,
    domanda,
    risposta_corretta,
    risposta_errata_1,
    risposta_errata_2,
    risposta_errata_3
)
VALUES

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Chi ha scritto la Divina Commedia?',
'Dante Alighieri',
'Francesco Petrarca',
'Giovanni Boccaccio',
'Alessandro Manzoni'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Chi è l''autore de I Promessi Sposi?',
'Alessandro Manzoni',
'Giacomo Leopardi',
'Italo Calvino',
'Luigi Pirandello'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale personaggio combatte contro i mulini a vento nel romanzo di Cervantes?',
'Don Chisciotte',
'Ulisse',
'Amleto',
'Robinson Crusoe'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Chi ha scritto Romeo e Giulietta?',
'William Shakespeare',
'Charles Dickens',
'Oscar Wilde',
'Jane Austen'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale poema epico racconta il viaggio di Ulisse?',
'Odissea',
'Iliade',
'Eneide',
'Orlando Furioso'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Chi ha scritto Il nome della rosa?',
'Umberto Eco',
'Italo Calvino',
'Gabriele D''Annunzio',
'Primo Levi'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale autore ha scritto Pinocchio?',
'Carlo Collodi',
'Gianni Rodari',
'Emilio Salgari',
'Edmondo De Amicis'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale scrittore ha creato Sherlock Holmes?',
'Arthur Conan Doyle',
'Agatha Christie',
'Edgar Allan Poe',
'Jules Verne'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale romanzo inizia con la frase "Quel ramo del lago di Como..."?',
'I Promessi Sposi',
'I Malavoglia',
'Il Gattopardo',
'Cuore'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Chi ha scritto Il piccolo principe?',
'Antoine de Saint-Exupéry',
'Victor Hugo',
'Jules Verne',
'Hans Christian Andersen'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale poeta italiano ha scritto L''infinito?',
'Giacomo Leopardi',
'Ugo Foscolo',
'Giovanni Pascoli',
'Giosuè Carducci'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale autore ha scritto Dracula?',
'Bram Stoker',
'Mary Shelley',
'Stephen King',
'Robert Louis Stevenson'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Chi ha scritto Frankenstein?',
'Mary Shelley',
'Jane Austen',
'Emily Brontë',
'Virginia Woolf'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale autore italiano ha scritto Se questo è un uomo?',
'Primo Levi',
'Italo Svevo',
'Cesare Pavese',
'Elio Vittorini'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale poeta latino accompagnò Dante nell''Inferno e nel Purgatorio?',
'Virgilio',
'Ovidio',
'Orazio',
'Catullo'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale scrittore ha creato il personaggio di Tarzan?',
'Edgar Rice Burroughs',
'Mark Twain',
'Jack London',
'Rudyard Kipling'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale romanzo di George Orwell parla di una società controllata dal Grande Fratello?',
'1984',
'La fattoria degli animali',
'Il mondo nuovo',
'Fahrenheit 451'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Chi ha scritto Le avventure di Tom Sawyer?',
'Mark Twain',
'Ernest Hemingway',
'Charles Dickens',
'Herman Melville'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale autore ha scritto Il Gattopardo?',
'Giuseppe Tomasi di Lampedusa',
'Luigi Pirandello',
'Italo Calvino',
'Alberto Moravia'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale opera racconta la guerra tra Greci e Troiani?',
'Iliade',
'Odissea',
'Eneide',
'Metamorfosi'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Chi ha scritto Cent''anni di solitudine?',
'Gabriel García Márquez',
'Pablo Neruda',
'Jorge Luis Borges',
'Mario Vargas Llosa'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale autore ha scritto Cuore?',
'Edmondo De Amicis',
'Collodi',
'Manzoni',
'Pascoli'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Chi è l''autore de La metamorfosi?',
'Franz Kafka',
'Thomas Mann',
'Hermann Hesse',
'Stefan Zweig'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale scrittore ha creato Harry Potter?',
'J.K. Rowling',
'J.R.R. Tolkien',
'Stephenie Meyer',
'Suzanne Collins'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale autore ha scritto Il Signore degli Anelli?',
'J.R.R. Tolkien',
'C.S. Lewis',
'George R.R. Martin',
'Philip Pullman'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale personaggio di Daniel Defoe naufraga e vive per anni su un''isola deserta?',
'Robinson Crusoe',
'Gulliver',
'Oliver Twist',
'Heathcliff'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale scrittore italiano ha ricevuto il Premio Nobel per la Letteratura nel 1997?',
'Dario Fo',
'Luigi Pirandello',
'Salvatore Quasimodo',
'Eugenio Montale'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Chi ha scritto Il giro del mondo in 80 giorni?',
'Jules Verne',
'H.G. Wells',
'Alexandre Dumas',
'Victor Hugo'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale autore ha scritto Il vecchio e il mare?',
'Ernest Hemingway',
'F. Scott Fitzgerald',
'John Steinbeck',
'Herman Melville'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale romanzo di Michail Bulgakov fu pubblicato integralmente solo molti anni dopo la morte dell''autore?',
'Il Maestro e Margherita',
'Cuore di cane',
'La guardia bianca',
'Le uova fatali'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale poeta latino è autore delle "Metamorfosi"?',
'Ovidio',
'Virgilio',
'Lucano',
'Catullo'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'In quale città immaginaria è ambientato il romanzo "Cent''anni di solitudine"?',
'Macondo',
'Comala',
'Yoknapatawpha',
'Santa María'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale romanzo di Italo Calvino coinvolge un Lettore che tenta ripetutamente di iniziare un libro?',
'Se una notte d''inverno un viaggiatore',
'Il castello dei destini incrociati',
'Le città invisibili',
'Palomar'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale tragedia di Shakespeare ha per protagonista il condottiero romano assassinato alle Idi di marzo?',
'Giulio Cesare',
'Antonio e Cleopatra',
'Coriolano',
'Riccardo III'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Chi scrisse il poema epico "Paradise Lost"?',
'John Milton',
'Geoffrey Chaucer',
'Alexander Pope',
'William Blake'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale autore è considerato il principale esponente del Verismo italiano?',
'Giovanni Verga',
'Luigi Capuana',
'Federico De Roberto',
'Matilde Serao'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale personaggio è il protagonista del romanzo "Il processo" di Franz Kafka?',
'Josef K.',
'Gregor Samsa',
'Karl Rossmann',
'Georg Bendemann'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale scrittore irlandese è autore dell''Ulisse?',
'James Joyce',
'Oscar Wilde',
'Samuel Beckett',
'Jonathan Swift'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale autore scrisse il romanzo distopico "Noi", considerato precursore di "1984"?',
'Evgenij Zamjatin',
'Aldous Huxley',
'Ray Bradbury',
'George Orwell'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Chi è l''autore del "Decameron"?',
'Giovanni Boccaccio',
'Franco Sacchetti',
'Dante Alighieri',
'Francesco Petrarca'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale autore francese scrisse "Alla ricerca del tempo perduto"?',
'Marcel Proust',
'Émile Zola',
'Honoré de Balzac',
'Gustave Flaubert'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale poeta italiano ricevette il Premio Nobel per la Letteratura nel 1975?',
'Eugenio Montale',
'Salvatore Quasimodo',
'Giosuè Carducci',
'Luigi Pirandello'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Nel poema dantesco, chi accompagna Dante nel Paradiso dopo Virgilio?',
'Beatrice',
'Matelda',
'Lucia',
'Rachele'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale romanzo di Fëdor Dostoevskij ha come protagonista il principe Lev Nikolaevič Myškin?',
'L''Idiota',
'I demoni',
'I fratelli Karamazov',
'Memorie dal sottosuolo'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale autore italiano scrisse il romanzo "Il barone rampante"?',
'Italo Calvino',
'Dino Buzzati',
'Cesare Pavese',
'Alberto Moravia'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale scrittrice creò il detective Hercule Poirot?',
'Agatha Christie',
'Dorothy L. Sayers',
'Patricia Highsmith',
'P. D. James'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale romanzo di Herman Melville racconta l''ossessione del capitano Achab?',
'Moby Dick',
'L''isola del tesoro',
'Il richiamo della foresta',
'Cuore di tenebra'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale scrittrice è autrice di Orgoglio e pregiudizio?',
'Jane Austen',
'Charlotte Brontë',
'Emily Brontë',
'Virginia Woolf'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Chi ha scritto Le avventure di Alice nel Paese delle Meraviglie?',
'Lewis Carroll',
'James Matthew Barrie',
'Rudyard Kipling',
'Robert Louis Stevenson'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quanti versi contiene un sonetto nella sua forma italiana tradizionale?',
'Quattordici',
'Dodici',
'Sedici',
'Diciotto'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale autore francese scrisse I miserabili?',
'Victor Hugo',
'Honoré de Balzac',
'Émile Zola',
'Gustave Flaubert'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale poeta italiano scrisse San Martino, che inizia con la nebbia agli irti colli?',
'Giosuè Carducci',
'Giovanni Pascoli',
'Giuseppe Ungaretti',
'Umberto Saba'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale scrittore creò il commissario Montalbano?',
'Andrea Camilleri',
'Carlo Lucarelli',
'Giorgio Scerbanenco',
'Maurizio de Giovanni'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale romanzo ha per protagonista il giovane Jim Hawkins e il pirata Long John Silver?',
'L''isola del tesoro',
'Il corsaro nero',
'Capitani coraggiosi',
'Ventimila leghe sotto i mari'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'facile',
'Quale autore scrisse la raccolta di racconti Il libro della giungla?',
'Rudyard Kipling',
'Jack London',
'Joseph Conrad',
'Daniel Defoe'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale romanzo di Italo Svevo ha come protagonista un uomo che racconta anche i suoi tentativi di smettere di fumare?',
'La coscienza di Zeno',
'Senilità',
'Una vita',
'Il fu Mattia Pascal'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale scrittrice italiana ricevette il Nobel per la letteratura nel 1926?',
'Grazia Deledda',
'Elsa Morante',
'Natalia Ginzburg',
'Matilde Serao'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale romanzo di Albert Camus ha come protagonista Meursault?',
'Lo straniero',
'La peste',
'La caduta',
'L''uomo in rivolta'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale poeta scrisse la raccolta I fiori del male?',
'Charles Baudelaire',
'Arthur Rimbaud',
'Paul Verlaine',
'Stéphane Mallarmé'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale autrice scrisse Cime tempestose?',
'Emily Brontë',
'Charlotte Brontë',
'Anne Brontë',
'George Eliot'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale romanzo di Ray Bradbury descrive una società in cui i pompieri bruciano libri?',
'Fahrenheit 451',
'Cronache marziane',
'Il mondo nuovo',
'La strada'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale romanzo di Luigi Pirandello ha come protagonista Vitangelo Moscarda?',
'Uno, nessuno e centomila',
'Il fu Mattia Pascal',
'I vecchi e i giovani',
'L''esclusa'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale scrittrice è autrice di Una stanza tutta per sé?',
'Virginia Woolf',
'Simone de Beauvoir',
'Doris Lessing',
'Marguerite Yourcenar'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale città fa da scenario principale al romanzo di James Joyce ambientato il 16 giugno 1904?',
'Dublino',
'Belfast',
'Londra',
'Cork'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'medio',
'Quale poema di Ludovico Ariosto narra la follia amorosa di un paladino?',
'Orlando furioso',
'Orlando innamorato',
'Gerusalemme liberata',
'La secchia rapita'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale scrittore portoghese è noto per gli eteronimi Alberto Caeiro, Ricardo Reis e Álvaro de Campos?',
'Fernando Pessoa',
'José Saramago',
'Eça de Queirós',
'António Lobo Antunes'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale scrittrice giapponese è tradizionalmente riconosciuta come autrice del Genji monogatari?',
'Murasaki Shikibu',
'Sei Shōnagon',
'Ono no Komachi',
'Izumi Shikibu'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale autore nigeriano scrisse Il crollo, titolo italiano di Things Fall Apart?',
'Chinua Achebe',
'Wole Soyinka',
'Ben Okri',
'Ken Saro-Wiwa'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale romanzo di Thomas Mann è ambientato in gran parte in un sanatorio di Davos?',
'La montagna incantata',
'I Buddenbrook',
'Doctor Faustus',
'Morte a Venezia'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale autore argentino scrisse la raccolta Finzioni?',
'Jorge Luis Borges',
'Julio Cortázar',
'Adolfo Bioy Casares',
'Ernesto Sabato'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale poeta compose l''opera sperimentale La terra desolata, pubblicata nel 1922?',
'T. S. Eliot',
'Ezra Pound',
'W. B. Yeats',
'Wallace Stevens'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale romanzo di Georges Perec fu scritto senza usare la lettera e nel testo francese?',
'La scomparsa',
'La vita istruzioni per l''uso',
'Le cose',
'Un uomo che dorme'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale scrittore scrisse il romanzo Il tamburo di latta?',
'Günter Grass',
'Heinrich Böll',
'Thomas Bernhard',
'Hermann Hesse'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale tragediografo greco scrisse Le Baccanti?',
'Euripide',
'Sofocle',
'Eschilo',
'Aristofane'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale autrice scrisse Memorie di Adriano?',
'Marguerite Yourcenar',
'Marguerite Duras',
'Simone de Beauvoir',
'Colette'
);

INSERT INTO domande (
    categoria_id,
    difficolta,
    domanda,
    risposta_corretta,
    risposta_errata_1,
    risposta_errata_2,
    risposta_errata_3
)
VALUES

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Chi fondò Microsoft insieme a Paul Allen?',
'Bill Gates',
'Steve Jobs',
'Mark Zuckerberg',
'Elon Musk'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale azienda sviluppa il sistema operativo Android?',
'Google',
'Apple',
'Microsoft',
'Samsung'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Che cosa significa l''acronimo CPU?',
'Central Processing Unit',
'Computer Personal Unit',
'Central Program Utility',
'Control Processing User'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale linguaggio viene eseguito principalmente nei browser web?',
'JavaScript',
'Java',
'C++',
'Python'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Chi ha fondato Apple insieme a Steve Wozniak?',
'Steve Jobs',
'Bill Gates',
'Larry Page',
'Jeff Bezos'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale dispositivo viene utilizzato per archiviare dati permanentemente?',
'Hard disk',
'RAM',
'CPU',
'Scheda video'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Che cosa indica l''acronimo HTML?',
'HyperText Markup Language',
'High Technology Machine Language',
'Hyper Transfer Main Link',
'Home Tool Markup Language'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale azienda ha sviluppato il sistema operativo Windows?',
'Microsoft',
'Apple',
'IBM',
'Google'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale componente elabora principalmente i dati di un computer?',
'Processore',
'Monitor',
'Tastiera',
'Stampante'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale linguaggio è stato creato da Guido van Rossum?',
'Python',
'Java',
'C#',
'PHP'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale azienda produce gli iPhone?',
'Apple',
'Samsung',
'Google',
'Microsoft'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Che cosa significa l''acronimo RAM?',
'Random Access Memory',
'Rapid Access Machine',
'Read Access Memory',
'Random Application Module'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale motore di ricerca fu ideato da Larry Page e Sergey Brin?',
'Google Search',
'Bing',
'Yahoo',
'DuckDuckGo'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale tecnologia permette la connessione senza fili a breve distanza tra dispositivi?',
'Bluetooth',
'Ethernet',
'USB',
'HDMI'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale social network è stato fondato da Mark Zuckerberg?',
'Facebook',
'Twitter',
'Instagram',
'LinkedIn'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale linguaggio viene spesso utilizzato per creare applicazioni Android native?',
'Kotlin',
'HTML',
'SQL',
'CSS'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale unità misura la capacità di archiviazione dei dati?',
'Byte',
'Watt',
'Volt',
'Metro'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale azienda ha creato il servizio di cloud AWS?',
'Amazon',
'Google',
'Microsoft',
'IBM'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale programma viene usato per navigare su Internet?',
'Browser',
'Compiler',
'Database',
'Antivirus'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale sistema operativo è open source basato sul kernel Linux?',
'Ubuntu',
'Windows',
'iOS',
'macOS'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Che cosa rappresenta l''acronimo USB?',
'Universal Serial Bus',
'United System Base',
'Universal Software Block',
'User Service Backup'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale azienda possiede YouTube?',
'Google',
'Meta',
'Amazon',
'Microsoft'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale componente permette di visualizzare immagini sul computer?',
'Monitor',
'Router',
'RAM',
'Processore'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale database è un sistema relazionale molto diffuso?',
'MySQL',
'Photoshop',
'Chrome',
'Linux'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale dispositivo instrada i pacchetti tra reti informatiche diverse?',
'Router',
'Switch',
'Scanner',
'Webcam'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Che cosa indica l''acronimo AI?',
'Artificial Intelligence',
'Automatic Internet',
'Advanced Interface',
'Artificial Integration'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale azienda produce la console PlayStation?',
'Sony',
'Nintendo',
'Microsoft',
'Sega'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale protocollo viene utilizzato per navigare sul web in modo sicuro?',
'HTTPS',
'FTP',
'SMTP',
'POP3'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale dispositivo viene usato per stampare documenti?',
'Stampante',
'Scanner',
'Router',
'Modem'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale linguaggio viene utilizzato per interrogare database relazionali?',
'SQL',
'HTML',
'CSS',
'XML'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale informatico, insieme a Vint Cerf, è considerato uno dei padri del protocollo TCP/IP?',
'Robert Kahn',
'Tim Berners-Lee',
'Dennis Ritchie',
'Jon Postel'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale azienda sviluppò il processore 6502, utilizzato tra gli altri nel Commodore 64 e nell''Apple II?',
'MOS Technology',
'Intel',
'Motorola',
'Zilog'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale sistema di controllo di versione distribuito fu creato da Linus Torvalds nel 2005?',
'Git',
'Subversion',
'Mercurial',
'CVS'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale linguaggio di programmazione fu progettato da Bjarne Stroustrup a partire dal 1979?',
'C++',
'Rust',
'Go',
'Pascal'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale protocollo di rete viene utilizzato per ottenere automaticamente un indirizzo IP in una rete locale?',
'DHCP',
'ARP',
'DNS',
'ICMP'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale algoritmo di cifratura asimmetrica prende il nome dalle iniziali dei suoi tre inventori?',
'RSA',
'AES',
'DES',
'Blowfish'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale database relazionale open source è stato originariamente sviluppato in Svezia da Michael Widenius?',
'MySQL',
'PostgreSQL',
'MariaDB',
'Firebird'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale protocollo applicativo utilizza normalmente la porta TCP 443?',
'HTTPS',
'HTTP',
'SSH',
'SMTP'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale informatico inventò il World Wide Web mentre lavorava al CERN?',
'Tim Berners-Lee',
'Vint Cerf',
'Douglas Engelbart',
'Alan Kay'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale sistema operativo didattico ispirò inizialmente Linus Torvalds nello sviluppo del kernel Linux?',
'MINIX',
'GNU/Linux',
'UNIX System V',
'BSD'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale protocollo viene utilizzato per tradurre i nomi di dominio in indirizzi IP?',
'DNS',
'DHCP',
'FTP',
'NTP'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale algoritmo di hashing è utilizzato da Bitcoin per il processo di mining?',
'SHA-256',
'SHA-1',
'MD5',
'BLAKE2'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale azienda sviluppò originariamente il linguaggio di programmazione Java?',
'Sun Microsystems',
'Oracle',
'IBM',
'Digital Equipment Corporation'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale protocollo consente di gestire e trasferire file attraverso una sessione SSH con comandi dedicati?',
'SFTP',
'FTPS',
'TFTP',
'SCP'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale scienziato è considerato il padre teorico dell''informatica grazie alla macchina che porta il suo nome?',
'Alan Turing',
'John von Neumann',
'Claude Shannon',
'Konrad Zuse'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale componente perde normalmente i dati memorizzati quando viene tolta l''alimentazione?',
'RAM',
'SSD',
'Disco rigido',
'Memoria flash USB'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'A che cosa serve principalmente una copia di backup?',
'Ripristinare dati in caso di perdita',
'Aumentare la risoluzione dello schermo',
'Raffreddare il processore',
'Accelerare la tastiera'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale dispositivo converte un documento cartaceo in un''immagine digitale?',
'Scanner',
'Proiettore',
'Plotter',
'Altoparlante'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale formato è comunemente usato per distribuire documenti mantenendone l''impaginazione?',
'PDF',
'MP3',
'CSV',
'WAV'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale componente è specializzato nell''elaborazione grafica?',
'GPU',
'Alimentatore',
'Scheda audio',
'Scheda di rete'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Come si chiama un tentativo di sottrarre credenziali fingendosi un servizio affidabile tramite un messaggio?',
'Phishing',
'Deframmentazione',
'Streaming',
'Rendering'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quanti bit formano un byte?',
'Otto',
'Quattro',
'Sedici',
'Trentadue'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale collegamento trasporta normalmente audio e video digitali tra un computer e un televisore?',
'HDMI',
'RJ11',
'Jack audio da 3,5 mm',
'PS/2'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale funzione svolge il cestino di un sistema operativo desktop?',
'Conserva temporaneamente i file eliminati in modo ordinario',
'Cifra automaticamente tutti i documenti',
'Aggiorna i programmi installati',
'Corregge gli errori del disco'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'facile',
'Quale tecnologia consente a un lettore di riconoscere a breve distanza una carta contactless?',
'NFC',
'GPS',
'ADSL',
'DVB-T'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale linguaggio definisce principalmente l''aspetto grafico delle pagine web?',
'CSS',
'SQL',
'Bash',
'C'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale formato di immagine usa normalmente compressione con perdita ed è molto diffuso per le fotografie?',
'JPEG',
'PNG',
'BMP',
'PBM'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale tipo di malware blocca o cifra i dati e chiede un pagamento per sbloccarli?',
'Ransomware',
'Adware',
'Keylogger',
'Rootkit'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale sistema satellitare statunitense permette di determinare una posizione geografica?',
'GPS',
'Galileo',
'GLONASS',
'BeiDou'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale struttura dati segue la regola «ultimo entrato, primo uscito»?',
'Pila',
'Coda FIFO',
'Lista ordinata',
'Tabella hash'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale unità esprime normalmente la velocità di trasferimento di una connessione di rete?',
'Bit al secondo',
'Byte per pollice',
'Hertz per pixel',
'Volt per metro'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'In un database relazionale, che cosa garantisce una chiave primaria?',
'L''identificazione univoca di ogni riga',
'L''ordinamento alfabetico di ogni colonna',
'La cifratura automatica dei valori',
'La duplicazione di tutte le righe'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale protocollo viene usato normalmente per l''invio della posta elettronica tra server?',
'SMTP',
'IMAP',
'POP3',
'NTP'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale pratica aggiunge alla password un secondo elemento indipendente per verificare l''identità?',
'Autenticazione a due fattori',
'Compressione dei dati',
'Navigazione privata',
'Indicizzazione dei file'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'medio',
'Quale componente trasforma la corrente della rete elettrica nelle tensioni necessarie a un PC desktop?',
'Alimentatore',
'Dissipatore',
'Scheda madre',
'Scheda di rete'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale algoritmo trova cammini minimi da una sorgente in un grafo con pesi non negativi?',
'Algoritmo di Dijkstra',
'Algoritmo di Kruskal',
'Algoritmo di Prim',
'Algoritmo di Kahn'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale proprietà delle transazioni ACID richiede che tutte le operazioni siano completate oppure nessuna sia applicata?',
'Atomicità',
'Isolamento',
'Durabilità',
'Consistenza'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale struttura bilanciata è comunemente usata per gli indici nei database relazionali?',
'B-tree',
'Pila LIFO',
'Coda circolare',
'Lista semplicemente concatenata'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quanti bit contiene un indirizzo IPv6?',
'128',
'32',
'64',
'256'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale complessità temporale ha la ricerca binaria su un array ordinato di n elementi?',
'O(log n)',
'O(n)',
'O(n log n)',
'O(n²)'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale chiamata di sistema Unix crea un nuovo processo duplicando quello chiamante?',
'fork',
'execve',
'wait',
'open'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale protocollo sincronizza gli orologi dei computer attraverso una rete?',
'NTP',
'SNMP',
'ARP',
'BGP'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale principio di progettazione richiede che un modulo dipenda da astrazioni invece che da implementazioni concrete?',
'Inversione delle dipendenze',
'Responsabilità singola',
'Segregazione delle interfacce',
'Sostituzione di Liskov'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'In crittografia, quale proprietà richiede che sia difficile ricavare un input da un valore hash assegnato?',
'Resistenza alla preimmagine',
'Segretezza perfetta',
'Non ripudio',
'Autenticazione reciproca'
),

(
(SELECT id FROM categorie WHERE nome = 'Tecnologia'),
'difficile',
'Quale meccanismo permette a un processore di eseguire più istruzioni sovrapponendone le fasi?',
'Pipeline',
'Spooling',
'Journaling',
'Garbage collection'
);

INSERT INTO domande (
    categoria_id,
    difficolta,
    domanda,
    risposta_corretta,
    risposta_errata_1,
    risposta_errata_2,
    risposta_errata_3
)
VALUES

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale personaggio Disney è fidanzato con Minni?',
'Topolino',
'Paperino',
'Pippo',
'Pluto'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale personaggio Disney ha il becco arancione ed è spesso arrabbiato?',
'Paperino',
'Topolino',
'Pippo',
'Gambadilegno'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Qual è l''identità civile di Spider-Man nella versione originale più nota dei fumetti Marvel?',
'Peter Parker',
'Bruce Wayne',
'Clark Kent',
'Matt Murdock'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale supereroe è conosciuto come Uomo d''Acciaio?',
'Superman',
'Batman',
'Iron Man',
'Hulk'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale personaggio vive in una casa a forma di ananas sotto il mare?',
'SpongeBob',
'Patrick',
'Shrek',
'Nemo'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Quale autore giapponese ha creato Dragon Ball?',
'Akira Toriyama',
'Eiichiro Oda',
'Masashi Kishimoto',
'Hayao Miyazaki'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Come si chiama il protagonista di Dragon Ball?',
'Son Goku',
'Vegeta',
'Naruto',
'Ichigo'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Che tipo di animale è Jerry nella serie animata "Tom & Jerry"?',
'Topo',
'Gatto',
'Cane',
'Coniglio'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale principessa Disney ha perso una scarpetta al ballo?',
'Cenerentola',
'Biancaneve',
'Aurora',
'Ariel'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale supereroe utilizza uno scudo con una stella?',
'Captain America',
'Thor',
'Batman',
'Flash'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Quale fumetto giapponese racconta le avventure di Monkey D. Rufy?',
'One Piece',
'Naruto',
'Bleach',
'Pokémon'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale personaggio Disney è una fata?',
'Trilli',
'Alice',
'Mulan',
'Pocahontas'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Come si chiama il mago nemico di Harry Potter?',
'Lord Voldemort',
'Sauron',
'Gargamella',
'Jafar'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale personaggio dei Looney Tunes è un coniglio?',
'Bugs Bunny',
'Daffy Duck',
'Porky Pig',
'Wile E. Coyote'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale serie animata ha come protagonisti Leonardo, Raffaello, Donatello e Michelangelo?',
'Tartarughe Ninja',
'Pokémon',
'I Simpson',
'I Puffi'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Quale supereroe vive a Gotham City?',
'Batman',
'Superman',
'Spider-Man',
'Wolverine'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Come si chiama il leone protagonista de Il Re Leone?',
'Simba',
'Mufasa',
'Timon',
'Scar'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale personaggio vive nel mondo dei Pokémon?',
'Ash Ketchum',
'Goku',
'Luffy',
'Naruto'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Chi è il creatore dei Pokémon?',
'Satoshi Tajiri',
'Shigeru Miyamoto',
'Akira Toriyama',
'Hayao Miyazaki'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale personaggio dei fumetti è un uomo pipistrello?',
'Batman',
'Robin',
'Flash',
'Daredevil'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Quale studio giapponese ha prodotto La città incantata?',
'Studio Ghibli',
'Pixar',
'Disney',
'DreamWorks'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale personaggio Disney è una papera?',
'Paperino',
'Pippo',
'Pluto',
'Bambi'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Chi è il nemico principale di Batman?',
'Joker',
'Lex Luthor',
'Magneto',
'Goblin'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Quale personaggio anime usa la tecnica Rasengan?',
'Naruto',
'Goku',
'Vegeta',
'Zoro'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale orsetto vive nella foresta dei Cento Acri?',
'Winnie the Pooh',
'Paddington',
'Baloo',
'Bambi'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Quale autore ha creato il fumetto Tex?',
'Gian Luigi Bonelli',
'Hugo Pratt',
'Andrea Camilleri',
'Zerocalcare'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale personaggio Disney è una sirena?',
'Ariel',
'Elsa',
'Jasmine',
'Rapunzel'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Quale supereroe appartiene agli X-Men?',
'Wolverine',
'Iron Man',
'Batman',
'Flash'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale personaggio ha un naso molto lungo nella favola di Collodi?',
'Pinocchio',
'Peter Pan',
'Aladino',
'Hansel'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Quale personaggio dei fumetti italiani è un indagatore dell''incubo?',
'Dylan Dog',
'Diabolik',
'Tintin',
'Zagor'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale autore belga creò il personaggio di Tintin?',
'Hergé',
'René Goscinny',
'André Franquin',
'Peyo'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale dei seguenti NON è uno dei sette nani nel film Disney "Biancaneve e i sette nani"?',
'Felice',
'Pisolo',
'Brontolo',
'Eolo'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale regista giapponese ha diretto il film d''animazione "La città incantata"?',
'Hayao Miyazaki',
'Isao Takahata',
'Mamoru Hosoda',
'Satoshi Kon'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Chi è il creatore del personaggio di Dylan Dog?',
'Tiziano Sclavi',
'Sergio Bonelli',
'Guido Nolitta',
'Alfredo Castelli'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'In quale fiaba compare il personaggio di Tremotino?',
'Rumpelstiltskin',
'Hansel e Gretel',
'Il principe ranocchio',
'La guardiana delle oche'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale film fu il primo lungometraggio animato prodotto da Walt Disney?',
'Biancaneve e i sette nani',
'Pinocchio',
'Fantasia',
'Dumbo'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale fumettista statunitense creò Spider-Man insieme a Steve Ditko?',
'Stan Lee',
'Jack Kirby',
'Jim Shooter',
'John Romita Sr.'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale personaggio Disney è noto negli Stati Uniti con il nome di Scrooge McDuck?',
'Paperon de'' Paperoni',
'Paperino',
'Gastone',
'Archimede Pitagorico'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale autore francese, insieme ad Albert Uderzo, creò Asterix?',
'René Goscinny',
'Morris',
'Jean Van Hamme',
'Marcel Gotlib'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale film Pixar, uscito nel 2003, vinse l''Oscar come miglior film d''animazione nel 2004?',
'Alla ricerca di Nemo',
'Monsters & Co.',
'Gli Incredibili',
'Toy Story 2'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale celebre manga di Naoki Urasawa racconta la storia del neurochirurgo Kenzo Tenma?',
'Monster',
'20th Century Boys',
'Pluto',
'Billy Bat'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale principessa Disney si traveste da soldato per prendere il posto del padre nell''esercito?',
'Mulan',
'Jasmine',
'Pocahontas',
'Raya'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale autore danese scrisse "La sirenetta" e "Il brutto anatroccolo"?',
'Hans Christian Andersen',
'Charles Perrault',
'Jacob Grimm',
'Wilhelm Grimm'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale supereroe della DC Comics è originario del pianeta Krypton?',
'Superman',
'Lanterna Verde',
'Martian Manhunter',
'Shazam'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale fu il primo lungometraggio realizzato dallo Studio Ghibli?',
'Il castello nel cielo',
'Il mio vicino Totoro',
'Kiki - Consegne a domicilio',
'Porco Rosso'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Come si chiama il cane di Charlie Brown nei Peanuts?',
'Snoopy',
'Odie',
'Pluto',
'Milou'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale gatto dei fumetti ama le lasagne e vive con Jon Arbuckle?',
'Garfield',
'Silvestro',
'Felix',
'Gambadilegno'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Nella fiaba dei tre porcellini, quale materiale rende la casa resistente al soffio del lupo?',
'Mattoni',
'Paglia',
'Legno',
'Canne'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale marinaio dei fumetti acquista una forza straordinaria mangiando spinaci?',
'Braccio di Ferro',
'Corto Maltese',
'Capitan Harlock',
'Capitan Haddock'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Come si chiama il padre di Lisa nella famiglia Simpson?',
'Homer',
'Ned',
'Seymour',
'Barney'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale personaggio accompagna Asterix ed è solito portare menhir?',
'Obelix',
'Panoramix',
'Abraracourcix',
'Assurancetourix'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale oggetto consulta la regina per sapere chi sia la più bella nella fiaba di Biancaneve?',
'Uno specchio',
'Una sfera di cristallo',
'Un libro',
'Una clessidra'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale supereroina dei fumetti DC è anche la principessa Diana delle Amazzoni?',
'Wonder Woman',
'Supergirl',
'Batgirl',
'Catwoman'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Come si chiama il cowboy giocattolo protagonista di Toy Story?',
'Woody',
'Buzz Lightyear',
'Andy',
'Sid'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'facile',
'Quale personaggio dei cartoni tenta di catturare Beep Beep con complicati congegni?',
'Wile E. Coyote',
'Yosemite Sam',
'Taz',
'Elmer Fudd'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Quale autore creò i Peanuts?',
'Charles M. Schulz',
'Bill Watterson',
'Jim Davis',
'Walt Kelly'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Quale fumettista italiano creò Corto Maltese?',
'Hugo Pratt',
'Guido Crepax',
'Sergio Toppi',
'Milo Manara'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Nella fiaba di Hansel e Gretel dei fratelli Grimm, come segnano i bambini la strada la prima volta che vengono abbandonati?',
'Con sassolini bianchi',
'Con briciole di pane',
'Con fili di lana',
'Con semi di zucca'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Quale manga ha per protagonisti i fratelli Edward e Alphonse Elric?',
'Fullmetal Alchemist',
'Bleach',
'Hunter × Hunter',
'Yu Yu Hakusho'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'In quale città vivono i protagonisti della serie animata I Simpson?',
'Springfield',
'Quahog',
'South Park',
'Bikini Bottom'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Quale fumetto ha per protagonisti un bambino e una tigre di pezza che per lui prende vita?',
'Calvin e Hobbes',
'Dennis la minaccia',
'Mafalda',
'Zits'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Come si chiama il gatto di Gargamella nella versione italiana dei Puffi?',
'Birba',
'Romeo',
'Isidoro',
'Lucifero'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Quale oggetto viene usato da Light Yagami per uccidere nel manga Death Note?',
'Un quaderno',
'Una maschera',
'Una spada',
'Un orologio'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Quale personaggio è il nemico di Peter Pan e comanda una nave pirata?',
'Capitan Uncino',
'Long John Silver',
'Capitan Nemo',
'Capitan Flint'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'medio',
'Quale autrice creò il manga Sailor Moon?',
'Naoko Takeuchi',
'Rumiko Takahashi',
'Hiromu Arakawa',
'Moto Hagio'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale disegnatore realizzò Watchmen su testi di Alan Moore?',
'Dave Gibbons',
'Frank Miller',
'Brian Bolland',
'David Lloyd'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale autore argentino creò Mafalda?',
'Quino',
'Mordillo',
'Liniers',
'Héctor Germán Oesterheld'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale fumettista creò la serie Krazy Kat?',
'George Herriman',
'Winsor McCay',
'E. C. Segar',
'Bud Fisher'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale regista diresse il film d''animazione Una tomba per le lucciole?',
'Isao Takahata',
'Satoshi Kon',
'Mamoru Hosoda',
'Makoto Shinkai'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale coppia di autrici creò Diabolik?',
'Angela e Luciana Giussani',
'Elisabetta Gnone e Barbara Canepa',
'Paola Barbato e Barbara Baraldi',
'Vanna Vinci e Silvia Ziche'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale mangaka è autore di Akira?',
'Katsuhiro Ōtomo',
'Masamune Shirow',
'Yukito Kishiro',
'Go Nagai'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale autore realizzò il graphic novel Maus?',
'Art Spiegelman',
'Will Eisner',
'Joe Sacco',
'Harvey Pekar'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale favolista francese pubblicò le Fables a partire dal 1668?',
'Jean de La Fontaine',
'Charles Perrault',
'Charles Nodier',
'François Fénelon'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale personaggio di Carl Barks apparve per la prima volta nella storia Il Natale di Paperino sul Monte Orso del 1947?',
'Paperon de'' Paperoni',
'Gastone',
'Archimede Pitagorico',
'Amelia'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale disegnatore creò il personaggio di Valentina, apparso per la prima volta nel 1965?',
'Guido Crepax',
'Hugo Pratt',
'Dino Battaglia',
'Magnus'
);

INSERT INTO domande (
    categoria_id,
    difficolta,
    domanda,
    risposta_corretta,
    risposta_errata_1,
    risposta_errata_2,
    risposta_errata_3
)
VALUES

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale personaggio Nintendo è famoso per salvare la Principessa Peach?',
'Super Mario',
'Link',
'Kirby',
'Donkey Kong'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale console è prodotta da Sony?',
'PlayStation',
'Xbox',
'Switch',
'Game Boy'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale videogioco presenta il personaggio Link?',
'The Legend of Zelda',
'Final Fantasy',
'Pokémon',
'Metroid'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'In quale serie di videogiochi l''allenatore completa un Pokédex catturando diverse creature?',
'Pokémon',
'Minecraft',
'Fortnite',
'Terraria'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale azienda sviluppa la console Xbox?',
'Microsoft',
'Sony',
'Nintendo',
'Sega'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale videogioco è ambientato in un mondo fatto di blocchi da costruire?',
'Minecraft',
'FIFA',
'Call of Duty',
'The Sims'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale personaggio è la mascotte principale di Nintendo?',
'Mario',
'Sonic',
'Crash Bandicoot',
'Pikachu'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale saga videoludica ha come protagonista Kratos?',
'God of War',
'Assassin''s Creed',
'Dark Souls',
'Halo'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale gioco di calcio è sviluppato da EA Sports?',
'EA Sports FC',
'Gran Turismo',
'NBA 2K',
'Forza Horizon'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale personaggio è il protagonista della saga Halo?',
'Master Chief',
'Marcus Fenix',
'Kratos',
'Geralt'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale gioco presenta il personaggio Sonic?',
'Sonic the Hedgehog',
'Mario Kart',
'Crash Team Racing',
'Rayman'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale azienda pubblica la serie Grand Theft Auto?',
'Rockstar Games',
'Ubisoft',
'Valve',
'Capcom'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale videogioco permette di costruire e gestire una città?',
'SimCity',
'Pac-Man',
'Tetris',
'Doom'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale gioco contiene personaggi come Ryu e Ken?',
'Street Fighter',
'Tekken',
'Mortal Kombat',
'Super Smash Bros'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale saga è ambientata nel mondo di Tamriel?',
'The Elder Scrolls',
'Fallout',
'The Witcher',
'Dragon Age'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale videogioco ha come protagonista il personaggio Geralt di Rivia?',
'The Witcher',
'Skyrim',
'Dark Souls',
'Cyberpunk 2077'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale azienda giapponese produce la console Switch?',
'Nintendo',
'Sony',
'Microsoft',
'Sega'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'In quale videogioco arcade il giocatore attraversa un labirinto mangiando pallini ed evitando fantasmi?',
'Pac-Man',
'Donkey Kong',
'Frogger',
'Bomberman'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale saga comprende il personaggio Lara Croft?',
'Tomb Raider',
'Uncharted',
'Resident Evil',
'Assassin''s Creed'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale videogioco battle royale è stato sviluppato da Epic Games?',
'Fortnite',
'Apex Legends',
'PUBG',
'Valorant'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale saga horror presenta il personaggio Leon Kennedy?',
'Resident Evil',
'Silent Hill',
'Dead Space',
'Outlast'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale personaggio Nintendo è un gorilla?',
'Donkey Kong',
'Bowser',
'Yoshi',
'Luigi'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale gioco è stato creato da Mojang?',
'Minecraft',
'Fortnite',
'Valorant',
'Overwatch'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale videogioco consiste nell''eliminare linee di blocchi?',
'Tetris',
'Minecraft',
'Portal',
'Doom'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale società, prima della fusione con Enix, creò la saga Final Fantasy?',
'Square',
'Capcom',
'Konami',
'Sega'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale console portatile Nintendo è diventata famosa negli anni Novanta?',
'Game Boy',
'PSP',
'Steam Deck',
'Neo Geo'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale gioco ha come protagonista il cacciatore di mostri Aloy?',
'Horizon Zero Dawn',
'The Last of Us',
'Death Stranding',
'Control'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale saga automobilistica è esclusiva Xbox?',
'Forza Motorsport',
'Gran Turismo',
'Mario Kart',
'Need for Speed'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale videogioco è ambientato nella città immaginaria di Rapture?',
'BioShock',
'Half-Life',
'Portal',
'Prey'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale personaggio Pokémon è il più famoso della serie?',
'Pikachu',
'Charizard',
'Mewtwo',
'Eevee'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale azienda sviluppò la console Dreamcast?',
'Sega',
'SNK',
'NEC',
'Atari'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale game designer è il creatore della serie Metal Gear?',
'Hideo Kojima',
'Shigeru Miyamoto',
'Yu Suzuki',
'Hideki Kamiya'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale videogioco del 1993 è considerato il titolo che ha reso popolare il genere FPS moderno?',
'Doom',
'Wolfenstein 3D',
'Quake',
'Duke Nukem 3D'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale studio ha sviluppato il videogioco Half-Life?',
'Valve',
'id Software',
'Gearbox Software',
'Raven Software'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale console fu la prima di Sony ad adottare il formato Blu-ray come supporto principale?',
'PlayStation 3',
'PlayStation 2',
'PlayStation 4',
'PlayStation Portable'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale azienda sviluppò originariamente il motore grafico Unreal Engine?',
'Epic Games',
'Crytek',
'id Software',
'Valve'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale gioco introdusse per la prima volta il personaggio di GLaDOS?',
'Portal',
'Half-Life 2',
'Portal 2',
'Team Fortress 2'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale console a 128 bit fu prodotta da SEGA?',
'Dreamcast',
'Saturn',
'Mega Drive',
'Master System'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale studio sviluppò la serie Dark Souls?',
'FromSoftware',
'Capcom',
'PlatinumGames',
'Bandai Namco Studios'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale MMORPG di Blizzard Entertainment, pubblicato nel 2004, è ambientato nel mondo di Azeroth?',
'World of Warcraft',
'EverQuest',
'Ultima Online',
'Lineage'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale azienda realizzò la console Neo Geo?',
'SNK',
'Sega',
'NEC',
'Bandai'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale game designer è autore delle serie Shenmue e Virtua Fighter?',
'Yu Suzuki',
'Hideo Kojima',
'Tomonobu Itagaki',
'Goichi Suda'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale studio sviluppò The Witcher 3: Wild Hunt?',
'CD Projekt RED',
'Larian Studios',
'BioWare',
'Obsidian Entertainment'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale console Nintendo introdusse per la prima volta il controllo tramite sensori di movimento come elemento centrale?',
'Wii',
'GameCube',
'Nintendo 64',
'Wii U'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale motore grafico è stato sviluppato da id Software per Doom 3 e Quake 4?',
'id Tech 4',
'Source Engine',
'CryEngine',
'Unreal Engine 2'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'In quale serie si gestisce la vita quotidiana di personaggi, costruendo anche le loro abitazioni?',
'The Sims',
'Civilization',
'Age of Empires',
'RollerCoaster Tycoon'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale gioco combina partite di calcio con automobili controllate dai giocatori?',
'Rocket League',
'Trackmania',
'Burnout Paradise',
'Need for Speed'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale personaggio rosa di Nintendo può aspirare nemici e copiarne le abilità?',
'Kirby',
'Yoshi',
'Toad',
'Jigglypuff'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'In quale gioco bisogna individuare gli impostori tra i membri dell''equipaggio?',
'Among Us',
'Fall Guys',
'Overcooked',
'Gang Beasts'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale serie ha come protagonista l''avventuriero Nathan Drake?',
'Uncharted',
'Max Payne',
'Splinter Cell',
'Just Cause'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale saga Nintendo è incentrata su gare di kart e oggetti da usare contro gli avversari?',
'Mario Kart',
'F-Zero',
'Excitebike',
'Wave Race'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale gioco musicale utilizza tradizionalmente un controller a forma di chitarra?',
'Guitar Hero',
'Dance Dance Revolution',
'SingStar',
'Wii Music'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale serie segue gli avvocati Phoenix Wright e Apollo Justice?',
'Ace Attorney',
'Professor Layton',
'Danganronpa',
'Zero Escape'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale videogioco mette squadre di cuochi a collaborare in cucine caotiche?',
'Overcooked',
'Moving Out',
'Human: Fall Flat',
'Keep Talking and Nobody Explodes'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale serie Nintendo ha come protagonista la cacciatrice di taglie Samus Aran?',
'Metroid',
'Star Fox',
'Pikmin',
'Kid Icarus'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale studio sviluppò The Last of Us del 2013?',
'Naughty Dog',
'Insomniac Games',
'Bend Studio',
'Sucker Punch Productions'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'In quale città italiana è ambientata gran parte della sequenza iniziale di Assassin''s Creed II con Ezio adulto?',
'Firenze',
'Roma',
'Napoli',
'Milano'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale gioco di ruolo del 1997 ha Cloud Strife come protagonista?',
'Final Fantasy VII',
'Chrono Cross',
'Xenogears',
'Grandia'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Con quale pseudonimo è noto Eric Barone, autore di Stardew Valley?',
'ConcernedApe',
'Notch',
'SWERY',
'Suda51'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale serie Nintendo presenta gli Inkling che combattono usando inchiostro colorato?',
'Splatoon',
'ARMS',
'Advance Wars',
'Fire Emblem'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale compagnia pubblicò il primo Sonic the Hedgehog nel 1991?',
'Sega',
'Namco',
'Capcom',
'Konami'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale videogioco del 2017 è ambientato soprattutto nel regno di Hallownest?',
'Hollow Knight',
'Dead Cells',
'Celeste',
'Ori and the Blind Forest'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale serie strategica di Blizzard contrappone Terran, Zerg e Protoss?',
'StarCraft',
'Warcraft',
'Command & Conquer',
'Supreme Commander'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale console di Nintendo utilizzava due schermi, di cui quello inferiore sensibile al tocco, al suo debutto nel 2004?',
'Nintendo DS',
'Game Boy Advance',
'Nintendo 64',
'GameCube'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'medio',
'Quale gioco del 2005 ha come protagonista Wander, impegnato ad abbattere gigantesche creature?',
'Shadow of the Colossus',
'Ico',
'The Last Guardian',
'Okami'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale designer creò il gioco Another World, pubblicato nel 1991?',
'Éric Chahi',
'Paul Cuisset',
'Frédérick Raynal',
'Michel Ancel'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale compositore scrisse principalmente la colonna sonora di Chrono Trigger, con contributi di Nobuo Uematsu?',
'Yasunori Mitsuda',
'Hitoshi Sakimoto',
'Yoko Shimomura',
'Masashi Hamauzu'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale studio finlandese sviluppò il primo Max Payne?',
'Remedy Entertainment',
'Housemarque',
'RedLynx',
'Frozenbyte'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale gioco di ruolo del 1999 è ambientato principalmente nella città di Sigil?',
'Planescape: Torment',
'Baldur''s Gate',
'Icewind Dale',
'Arcanum'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale personaggio è il fratello di Solid Snake e antagonista principale di Metal Gear Solid del 1998?',
'Liquid Snake',
'Revolver Ocelot',
'Gray Fox',
'Vulcan Raven'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale studio sviluppò System Shock 2 insieme a Irrational Games?',
'Looking Glass Studios',
'Ion Storm',
'Raven Software',
'Monolith Productions'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale autore creò Return of the Obra Dinn?',
'Lucas Pope',
'Jonathan Blow',
'Derek Yu',
'Phil Fish'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale gioco del 1980 di Atari conteneva una celebre stanza nascosta con il nome di Warren Robinett?',
'Adventure',
'Pitfall!',
'Yars'' Revenge',
'River Raid'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale studio canadese sviluppò Eternal Darkness: Sanity''s Requiem?',
'Silicon Knights',
'BioWare',
'Digital Extremes',
'Radical Entertainment'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'difficile',
'Quale gioco di ruolo di Obsidian del 2010 si svolge nella regione del Mojave?',
'Fallout: New Vegas',
'Fallout 3',
'Wasteland 2',
'The Outer Worlds'
);

INSERT INTO domande (
    categoria_id,
    difficolta,
    domanda,
    risposta_corretta,
    risposta_errata_1,
    risposta_errata_2,
    risposta_errata_3
)
VALUES

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Qual è la forma di governo dell''Italia?',
'Repubblica parlamentare',
'Monarchia assoluta',
'Repubblica presidenziale',
'Dittatura'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Qual è la sede del Parlamento italiano?',
'Roma',
'Milano',
'Torino',
'Firenze'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quali sono i due rami del Parlamento italiano?',
'Camera dei deputati e Senato della Repubblica',
'Senato e Governo',
'Camera e Corte Costituzionale',
'Presidenza e Consiglio'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'In quale anno è entrata in vigore la Costituzione italiana?',
'1948',
'1945',
'1955',
'1960'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Chi è il capo dello Stato italiano?',
'Presidente della Repubblica',
'Presidente del Consiglio',
'Ministro dell''Interno',
'Presidente del Senato'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale istituzione dell''Unione Europea ha la propria sede principale a Bruxelles?',
'Commissione Europea',
'NATO',
'ONU',
'Corte Suprema USA'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Qual è la sigla dell''Organizzazione delle Nazioni Unite?',
'ONU',
'UE',
'NATO',
'OCSE'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale documento contiene i principi fondamentali dello Stato italiano?',
'Costituzione',
'Codice Civile',
'Trattato di Roma',
'Statuto Albertino'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale organo esercita il potere legislativo in Italia?',
'Parlamento',
'Governo',
'Magistratura',
'Presidenza della Repubblica'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'In quale città si tengono le sedute plenarie ufficiali del Parlamento europeo?',
'Strasburgo',
'Parigi',
'Berlino',
'Madrid'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale istituzione propone le leggi nell''Unione Europea?',
'Commissione Europea',
'Banca Centrale Europea',
'Corte dei Conti',
'Consiglio d''Europa'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale Stato ha come capitale Washington D.C.?',
'Stati Uniti',
'Canada',
'Australia',
'Regno Unito'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Chi è considerato il padre della Costituzione americana?',
'James Madison',
'George Washington',
'Abraham Lincoln',
'Thomas Edison'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale organizzazione militare comprende diversi Paesi occidentali?',
'NATO',
'ONU',
'UNESCO',
'FMI'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale Stato ha un sistema politico federale composto da Länder?',
'Germania',
'Italia',
'Francia',
'Spagna'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale organo dell''ONU si occupa principalmente di pace e sicurezza?',
'Consiglio di Sicurezza',
'Assemblea Nazionale',
'Corte Europea',
'Commissione Europea'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale città è sede del governo britannico?',
'Londra',
'Edimburgo',
'Liverpool',
'Manchester'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale principio prevede che i cittadini scelgano i propri rappresentanti?',
'Democrazia',
'Monarchia',
'Feudalesimo',
'Autocrazia'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale trattato ha istituito la Comunità Economica Europea?',
'Trattato di Roma',
'Trattato di Maastricht',
'Trattato di Lisbona',
'Trattato di Versailles'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'In quale Paese la Casa Bianca è la residenza ufficiale del capo dello Stato?',
'Stati Uniti',
'Francia',
'Germania',
'Canada'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale organismo controlla la politica monetaria dell''Eurozona?',
'Banca Centrale Europea',
'Fondo Monetario Internazionale',
'Banca Mondiale',
'Commissione Europea'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Come si chiama la forma istituzionale francese inaugurata dalla Costituzione del 1958?',
'Quinta Repubblica',
'Terza Repubblica',
'Quarta Repubblica',
'Sesta Repubblica'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale Paese europeo è una confederazione composta da 26 cantoni?',
'Svizzera',
'Germania',
'Austria',
'Belgio'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale organizzazione rappresenta una collaborazione tra molti Paesi europei?',
'Unione Europea',
'Nazioni Unite',
'NATO',
'Commonwealth'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale città è sede della Corte Internazionale di Giustizia?',
'L''Aia',
'Ginevra',
'Bruxelles',
'Vienna'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale potere dello Stato dà esecuzione alle leggi e attua l''indirizzo politico?',
'Potere esecutivo',
'Potere giudiziario',
'Potere economico',
'Potere militare'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale rivoluzione ha portato alla nascita della Repubblica francese?',
'Rivoluzione francese',
'Rivoluzione industriale',
'Rivoluzione americana',
'Rivoluzione russa'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale istituzione italiana controlla il rispetto della Costituzione?',
'Corte Costituzionale',
'Suprema Corte',
'Senato',
'Consiglio di Stato'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale leader sudafricano lottò contro l''apartheid?',
'Nelson Mandela',
'Desmond Tutu',
'Kofi Annan',
'Barack Obama'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale città ospita la sede principale delle Nazioni Unite?',
'New York',
'Ginevra',
'Parigi',
'Roma'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale filosofo è autore dell''opera "Il Leviatano", fondamentale per la teoria dello Stato moderno?',
'Thomas Hobbes',
'John Locke',
'Jean-Jacques Rousseau',
'Montesquieu'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale principio formulò Montesquieu nell''opera "Lo spirito delle leggi"?',
'La separazione dei poteri',
'La sovranità popolare',
'Il contratto sociale',
'La dittatura del proletariato'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale trattato istituì ufficialmente l''Unione Europea?',
'Trattato di Maastricht',
'Trattato di Roma',
'Trattato di Lisbona',
'Trattato di Nizza'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale istituzione dell''Unione Europea esercita di norma il diritto di iniziativa legislativa?',
'Commissione Europea',
'Parlamento Europeo',
'Consiglio Europeo',
'Corte di Giustizia dell''Unione Europea'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale filosofo politico è considerato il padre del liberalismo classico?',
'John Locke',
'Thomas Hobbes',
'Jean Bodin',
'Niccolò Machiavelli'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale città ospita la sede della Corte Europea dei Diritti dell''Uomo?',
'Strasburgo',
'Lussemburgo',
'Bruxelles',
'L''Aia'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale organo giudica i conflitti di attribuzione tra i poteri dello Stato italiano?',
'Corte costituzionale',
'Corte di cassazione',
'Consiglio di Stato',
'Consiglio superiore della magistratura'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale filosofo scrisse "Il Principe"?',
'Niccolò Machiavelli',
'Francesco Guicciardini',
'Tommaso Campanella',
'Jean Bodin'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale organizzazione internazionale ha sede principale a Vienna ed è responsabile dei controlli sull''energia atomica?',
'Agenzia Internazionale per l''Energia Atomica',
'OCSE',
'Interpol',
'UNESCO'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale sistema elettorale assegna i seggi in proporzione ai voti ottenuti dai partiti?',
'Sistema proporzionale',
'Sistema maggioritario secco',
'Sistema presidenziale',
'Sistema federale'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale documento del 1215 è considerato uno dei fondamenti del costituzionalismo moderno?',
'Magna Carta',
'Bill of Rights',
'Dichiarazione dei Diritti dell''Uomo',
'Petition of Right'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale organismo elegge il Segretario Generale delle Nazioni Unite su raccomandazione del Consiglio di Sicurezza?',
'Assemblea Generale dell''ONU',
'Consiglio Economico e Sociale',
'Corte Internazionale di Giustizia',
'UNESCO'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale città ospita la sede della NATO?',
'Bruxelles',
'Washington',
'Parigi',
'Ginevra'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale filosofo sosteneva il concetto di "volontà generale"?',
'Jean-Jacques Rousseau',
'John Stuart Mill',
'Thomas Hobbes',
'Alexis de Tocqueville'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale paese fu il primo ad introdurre il suffragio universale femminile a livello nazionale nel 1893?',
'Nuova Zelanda',
'Australia',
'Finlandia',
'Norvegia'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Come si chiama una consultazione in cui i cittadini votano direttamente su un quesito?',
'Referendum',
'Censimento',
'Sondaggio',
'Scrutinio parlamentare'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale carica guida l''amministrazione di un comune italiano?',
'Sindaco',
'Prefetto',
'Questore',
'Presidente di regione'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale simbolo compare al centro della bandiera delle Nazioni Unite?',
'Una mappa del mondo circondata da rami d''ulivo',
'Una bilancia circondata da stelle',
'Una colomba sopra un globo',
'Una corona circondata da spighe'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Come si chiamano, in generale, i partiti che non sostengono il governo in Parlamento?',
'Opposizione',
'Coalizione di governo',
'Corpo diplomatico',
'Pubblica amministrazione'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale istituzione eleggono direttamente i cittadini dell''Unione europea ogni cinque anni?',
'Parlamento europeo',
'Consiglio europeo',
'Commissione europea',
'Corte di giustizia dell''Unione europea'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'In quale paese il parlamento federale comprende il Bundestag?',
'Germania',
'Austria',
'Belgio',
'Svizzera'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale termine indica l''insieme delle persone aventi diritto di voto in un''elezione?',
'Corpo elettorale',
'Consiglio dei ministri',
'Gruppo parlamentare',
'Seggio elettorale'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale documento stabilisce obiettivi e proposte di un partito durante una campagna elettorale?',
'Programma elettorale',
'Verbale di scrutinio',
'Certificato elettorale',
'Registro anagrafico'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Come si chiama il trasferimento di competenze dal livello centrale a enti territoriali?',
'Decentramento',
'Accentramento',
'Protezionismo',
'Bicameralismo'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'facile',
'Quale emblema caratterizza la bandiera dell''Unione europea?',
'Dodici stelle dorate su fondo blu',
'Quindici stelle bianche su fondo rosso',
'Ventisette stelle argentate su fondo verde',
'Dieci stelle blu su fondo bianco'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quanto dura il mandato ordinario del Presidente della Repubblica italiana?',
'Sette anni',
'Cinque anni',
'Quattro anni',
'Sei anni'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Chi nomina il Presidente del Consiglio dei ministri in Italia?',
'Il Presidente della Repubblica',
'Il Presidente della Camera',
'Il Presidente del Senato',
'Il Presidente della Corte costituzionale'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale istituzione dell''UE riunisce i capi di Stato o di governo degli Stati membri?',
'Consiglio europeo',
'Consiglio dell''Unione europea',
'Commissione europea',
'Parlamento europeo'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale termine indica la sospensione dei lavori parlamentari mediante interventi prolungati e altre tattiche dilatorie?',
'Ostruzionismo',
'Bipolarismo',
'Trasformismo',
'Federalismo'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale sistema di governo prevede che l''esecutivo debba mantenere la fiducia del Parlamento?',
'Sistema parlamentare',
'Sistema presidenziale puro',
'Monarchia assoluta',
'Dittatura militare'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale paese ha un parlamento nazionale chiamato Knesset?',
'Israele',
'Grecia',
'Turchia',
'Giordania'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale organizzazione continentale succedette all''Organizzazione dell''Unità Africana nel 2002?',
'Unione africana',
'Lega araba',
'Comunità dell''Africa orientale',
'Comunità economica degli Stati dell''Africa occidentale'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale Camera del Congresso statunitense assegna due seggi a ciascuno Stato?',
'Senato',
'Camera dei rappresentanti',
'Assemblea nazionale',
'Camera dei delegati'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Come si chiama l''insieme di ministri che forma l''organo collegiale del governo italiano?',
'Consiglio dei ministri',
'Consiglio di Stato',
'Consiglio superiore della magistratura',
'Conferenza Stato-Regioni'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale principio vieta di concentrare nello stesso soggetto le funzioni di accusatore e giudice in un processo?',
'Imparzialità del giudice',
'Mandato imperativo',
'Sovranità popolare',
'Sussidiarietà territoriale'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale procedura consente al Bundestag di sostituire il cancelliere solo eleggendone contemporaneamente uno nuovo?',
'Sfiducia costruttiva',
'Scioglimento automatico',
'Impeachment presidenziale',
'Referendum revocatorio'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale articolo della Costituzione italiana stabilisce che la forma repubblicana non può essere oggetto di revisione costituzionale?',
'Articolo 139',
'Articolo 21',
'Articolo 81',
'Articolo 117'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale metodo di assegnazione proporzionale dei seggi usa divisori successivi 1, 2, 3, 4 e così via?',
'Metodo D''Hondt',
'Metodo Sainte-Laguë standard',
'Metodo Hare dei più alti resti',
'Metodo del voto alternativo'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale teorico politico sviluppò il concetto di posizione originaria e di velo d''ignoranza?',
'John Rawls',
'Robert Nozick',
'Carl Schmitt',
'Isaiah Berlin'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale forma di democrazia Arend Lijphart associò ad accordi tra élite di gruppi sociali distinti?',
'Democrazia consociativa',
'Democrazia plebiscitaria',
'Democrazia diretta',
'Democrazia deliberativa'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quanti membri permanenti siedono nel Consiglio di sicurezza delle Nazioni Unite?',
'Cinque',
'Quattro',
'Sei',
'Dieci'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale articolo della Costituzione italiana disciplina il referendum abrogativo delle leggi ordinarie?',
'Articolo 75',
'Articolo 50',
'Articolo 87',
'Articolo 134'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale trattato, firmato nel 1998, istituì la Corte penale internazionale?',
'Statuto di Roma',
'Trattato di Nizza',
'Convenzione di Vienna del 1969',
'Trattato di Amsterdam'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale studiosa analizzò le origini del totalitarismo in un''opera pubblicata nel 1951?',
'Hannah Arendt',
'Simone Weil',
'Rosa Luxemburg',
'Judith Shklar'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'difficile',
'Quale carica esercita le funzioni del Presidente della Repubblica italiana quando questi non può adempierle?',
'Presidente del Senato',
'Presidente della Camera',
'Presidente del Consiglio',
'Presidente della Corte costituzionale'
);

INSERT INTO domande (
    categoria_id,
    difficolta,
    domanda,
    risposta_corretta,
    risposta_errata_1,
    risposta_errata_2,
    risposta_errata_3
)
VALUES

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale organizzazione mondiale si occupa della salute pubblica?',
'Organizzazione Mondiale della Sanità (OMS)',
'UNESCO',
'NATO',
'FIFA'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale valuta è utilizzata dalla maggior parte dei Paesi dell''Unione Europea?',
'Euro',
'Dollaro',
'Sterlina',
'Yen'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale evento sportivo si è svolto a Parigi nel 2024?',
'Olimpiadi estive',
'Coppa del Mondo FIFA',
'Expo Universale',
'Mondiali di atletica'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale tecnologia è diventata protagonista negli ultimi anni nel campo dell''intelligenza artificiale?',
'IA generativa',
'Televisione analogica',
'Fax',
'Pellicola fotografica'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale Paese ha ospitato i Mondiali di calcio 2022?',
'Qatar',
'Russia',
'Brasile',
'Germania'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale conflitto iniziato nel 2022 ha coinvolto Russia e Ucraina?',
'Invasione russa dell''Ucraina',
'Guerra del Golfo',
'Guerra in Vietnam',
'Guerra civile spagnola'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale organizzazione riunisce i principali Paesi industrializzati del mondo?',
'G7',
'ONU',
'UE',
'ASEAN'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale piattaforma è famosa per i video brevi verticali?',
'TikTok',
'Wikipedia',
'Amazon',
'PayPal'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale settore riguarda lo sviluppo di auto elettriche?',
'Automotive',
'Agricoltura',
'Edilizia',
'Tessile'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale agenzia spaziale statunitense ha portato astronauti sulla Luna?',
'NASA',
'ESA',
'Roscosmos',
'JAXA'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale fenomeno riguarda l''aumento della temperatura media terrestre?',
'Riscaldamento globale',
'Era glaciale',
'Desertificazione lunare',
'Magnetismo terrestre'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale Paese ha adottato l''euro ed è entrato nello spazio Schengen il 1º gennaio 2023?',
'Croazia',
'Ucraina',
'Norvegia',
'Svizzera'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale social network era precedentemente conosciuto come Twitter?',
'X',
'Threads',
'Facebook',
'Telegram'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale settore studia e sviluppa robot e automazione?',
'Robotica',
'Geologia',
'Filologia',
'Cartografia'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale pandemia ha interessato il mondo a partire dal 2020?',
'COVID-19',
'SARS del 2003',
'Ebola',
'Influenza Spagnola'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale accordo internazionale sul clima fu adottato nel 2015 durante la COP21?',
'Accordo di Parigi',
'Trattato di Roma',
'Protocollo di Kyoto',
'Patto Atlantico'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale azienda produce il modello di auto elettrica Model 3?',
'Tesla',
'Toyota',
'Volkswagen',
'Ford'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale organizzazione gestisce il calcio mondiale?',
'FIFA',
'UEFA',
'NATO',
'IOC'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale fenomeno indica la diffusione delle notizie false online?',
'Fake news',
'Streaming',
'Cloud computing',
'Blockchain'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale città ospita le sedi principali della Commissione europea e del Consiglio europeo?',
'Bruxelles',
'Roma',
'Londra',
'Berlino'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale dispositivo è diventato fondamentale per la comunicazione moderna?',
'Smartphone',
'Macchina da scrivere',
'Fax',
'Telegrafo'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale settore riguarda la protezione dell''ambiente e delle risorse naturali?',
'Sostenibilità',
'Numismatica',
'Tipografia',
'Architettura'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale piattaforma è famosa per lo streaming di film e serie TV?',
'Netflix',
'Google Maps',
'Spotify',
'Dropbox'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale ufficio delle Nazioni Unite coordina la risposta umanitaria internazionale alle emergenze?',
'OCHA',
'UNESCO',
'UNIDO',
'UNWTO'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale fonte energetica è considerata rinnovabile?',
'Energia solare',
'Carbone',
'Petrolio',
'Gas naturale'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale tecnologia permette di conservare dati su server remoti?',
'Cloud computing',
'Stampante 3D',
'Bluetooth',
'GPS'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale applicazione è famosa per la messaggistica istantanea?',
'WhatsApp',
'Excel',
'Photoshop',
'Chrome'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale continente ha ospitato i Mondiali di calcio 2026?',
'Nord America',
'Europa',
'Asia',
'Africa'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale tema riguarda la riduzione delle emissioni inquinanti?',
'Lotta al cambiamento climatico',
'Esplorazione spaziale',
'Moda',
'Turismo'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale tecnologia utilizza registri digitali distribuiti?',
'Blockchain',
'Bluetooth',
'GPS',
'USB'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale obiettivo di temperatura più ambizioso è indicato nell''Accordo di Parigi rispetto ai livelli preindustriali?',
'Limitare l''aumento a 1,5 °C',
'Limitare l''aumento a 3 °C',
'Azzerare ogni variazione climatica',
'Ridurre la temperatura globale di 2 °C'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale organizzazione assegna annualmente il Premio Nobel per la Pace?',
'Comitato Norvegese per il Nobel',
'Accademia Reale Svedese delle Scienze',
'Parlamento Europeo',
'Nazioni Unite'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale organismo internazionale pubblica il rapporto di riferimento sui cambiamenti climatici noto come Assessment Report?',
'IPCC',
'UNESCO',
'FAO',
'OMM'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale paese è stato il primo ad adottare Bitcoin come valuta a corso legale?',
'El Salvador',
'Panama',
'Argentina',
'Paraguay'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale città ospita la sede principale dell''Organizzazione Mondiale della Sanità?',
'Ginevra',
'New York',
'Vienna',
'Londra'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale programma della NASA è stato avviato con l''obiettivo di riportare esseri umani sulla Luna dopo Apollo?',
'Artemis',
'Gemini',
'Mercury',
'Soyuz'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale organizzazione internazionale coordina il sistema di nomi a dominio (DNS) su Internet?',
'ICANN',
'IETF',
'IEEE',
'W3C'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale metallo alcalino, il più leggero della tavola periodica, è ampiamente usato nelle batterie ricaricabili?',
'Litio',
'Nichel',
'Rame',
'Alluminio'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale tecnica crittografica consente a due parti di concordare una chiave segreta su un canale non sicuro?',
'Scambio di chiavi Diffie-Hellman',
'Cifratura di Cesare',
'Funzione hash MD5',
'Codifica Base64'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale paese ospita la sede del World Economic Forum?',
'Svizzera',
'Germania',
'Stati Uniti',
'Paesi Bassi'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale organizzazione pubblica ogni anno il rapporto World Press Freedom Index?',
'Reporters Sans Frontières',
'Amnesty International',
'Human Rights Watch',
'Transparency International'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale organismo internazionale ha il compito di contrastare il riciclaggio di denaro attraverso raccomandazioni condivise?',
'FATF',
'OCSE',
'Banca Mondiale',
'Fondo Monetario Internazionale'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'In quale Paese si trova il grande giacimento di terre rare di Bayan Obo?',
'Cina',
'Australia',
'Canada',
'Sudafrica'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale tecnologia di comunicazione mobile rappresenta lo standard successivo al 4G LTE?',
'5G',
'WiMAX',
'LoRaWAN',
'NFC'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale indice misura annualmente la percezione della corruzione nel settore pubblico dei vari paesi?',
'Corruption Perceptions Index',
'Human Development Index',
'Global Peace Index',
'World Happiness Report'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale sovrano britannico è stato incoronato nell''abbazia di Westminster il 6 maggio 2023?',
'Carlo III',
'Giorgio VI',
'Edoardo VIII',
'Guglielmo IV'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale cattedrale parigina è stata riaperta nel dicembre 2024 dopo il grande incendio del 2019?',
'Notre-Dame',
'Saint-Denis',
'Saint-Louis des Invalides',
'Saint-Alexandre-Nevsky'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale paese è entrato nella NATO il 7 marzo 2024?',
'Svezia',
'Finlandia',
'Austria',
'Irlanda'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale paese ha realizzato l''allunaggio della missione Chandrayaan-3 nell''agosto 2023?',
'India',
'Giappone',
'Cina',
'Corea del Sud'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale città giapponese ha ospitato l''Esposizione universale del 2025?',
'Osaka',
'Tokyo',
'Kyoto',
'Nagoya'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale nazionale ha vinto il campionato europeo maschile di calcio del 2024?',
'Spagna',
'Inghilterra',
'Francia',
'Germania'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale film ha vinto l''Oscar come miglior film alla cerimonia del 2024?',
'Oppenheimer',
'Povere creature!',
'Barbie',
'Killers of the Flower Moon'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale connettore è stato previsto dalle regole UE sul caricabatterie comune applicabili agli smartphone dal 28 dicembre 2024?',
'USB-C',
'Micro-USB',
'Lightning',
'Mini-USB'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale fenomeno astronomico è stato visibile nella sua fase totale lungo una fascia di Messico, Stati Uniti e Canada l''8 aprile 2024?',
'Eclissi solare',
'Eclissi lunare',
'Transito di Venere',
'Occultazione di Marte'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'facile',
'Quale paese ha ospitato il vertice del G7 a Borgo Egnazia nel giugno 2024?',
'Italia',
'Francia',
'Germania',
'Canada'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale scrittrice sudcoreana ha ricevuto il Nobel per la letteratura nel 2024?',
'Han Kang',
'Shin Kyung-sook',
'Bae Suah',
'Choi Eun-young'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'In quale città si è tenuta la conferenza sul clima COP28 nel 2023?',
'Dubai',
'Baku',
'Sharm el-Sheikh',
'Glasgow'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Da quale asteroide provenivano i campioni consegnati sulla Terra da OSIRIS-REx nel settembre 2023?',
'Bennu',
'Ryugu',
'Itokawa',
'Eros'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale tecnologia vaccinale è stata favorita dalle scoperte di Karikó e Weissman, premiate con il Nobel per la medicina del 2023?',
'Vaccini a RNA messaggero',
'Vaccini a virus intero inattivato',
'Vaccini a virus vivo attenuato',
'Vaccini a tossoidi'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale organizzazione continentale è stata ammessa come membro permanente del G20 al vertice di Nuova Delhi del 2023?',
'Unione africana',
'Lega araba',
'ASEAN',
'Mercosur'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale infrastruttura di Baltimora è crollata nel marzo 2024 dopo l''urto della nave Dali?',
'Francis Scott Key Bridge',
'Golden Gate Bridge',
'Brooklyn Bridge',
'Verrazzano-Narrows Bridge'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale strada antica italiana è stata iscritta nella Lista del Patrimonio mondiale UNESCO nel luglio 2024?',
'Via Appia',
'Via Flaminia',
'Via Aurelia',
'Via Emilia'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale paese è diventato il quinto a effettuare un allunaggio morbido grazie alla sonda SLIM nel gennaio 2024?',
'Giappone',
'Israele',
'Corea del Sud',
'Emirati Arabi Uniti'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale paese ha riportato nel giugno 2024 i primi campioni della faccia nascosta della Luna con Chang''e-6?',
'Cina',
'India',
'Russia',
'Stati Uniti'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'medio',
'Quale paese ha ospitato a Belém la conferenza sul clima COP30 nel novembre 2025?',
'Brasile',
'Colombia',
'Perù',
'Messico'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale organizzazione giapponese di sopravvissuti ai bombardamenti atomici ha ricevuto il Nobel per la pace nel 2024?',
'Nihon Hidankyo',
'Peace Boat',
'Soka Gakkai International',
'Japan Red Cross Society'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale espressione designa il bilancio globale dell''azione climatica concluso per la prima volta alla COP28 del 2023?',
'Global Stocktake',
'Global Carbon Budget',
'Emissions Gap Report',
'Global Risk Report'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale trattato adottato dall''ONU nel giugno 2023 riguarda la biodiversità marina nelle aree oltre la giurisdizione nazionale?',
'Accordo BBNJ',
'Protocollo di Cartagena',
'Convenzione di Minamata',
'Protocollo di Nagoya'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale scala temporale è centrale negli impulsi luminosi studiati dai vincitori del Nobel per la fisica del 2023?',
'Attosecondi',
'Millisecondi',
'Microsecondi',
'Nanosecondi'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale classe di biomolecole è al centro dei lavori premiati con il Nobel per la chimica del 2024 a Baker, Hassabis e Jumper?',
'Proteine',
'Lipidi',
'Polisaccaridi',
'Acidi grassi'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale telescopio spaziale dell''ESA, lanciato nel luglio 2023, studia la materia oscura e l''energia oscura?',
'Euclid',
'Gaia',
'Cheops',
'Herschel'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale satellite di Didymos è stato colpito dalla missione DART nel settembre 2022?',
'Dimorphos',
'Phobos',
'Deimos',
'Dactyl'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale vettore ha lanciato la missione ESA Juice il 14 aprile 2023?',
'Ariane 5',
'Ariane 6',
'Vega-C',
'Falcon Heavy'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale quota minima delle aree terrestri e marine dell''UE deve essere coperta da misure di ripristino entro il 2030 secondo il regolamento approvato nel 2024?',
'20%',
'5%',
'40%',
'70%'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'In quale città si è conclusa nel dicembre 2022 la COP15 sulla biodiversità con l''adozione di un nuovo quadro globale?',
'Montréal',
'Vancouver',
'Toronto',
'Ottawa'
);

INSERT INTO domande (
    categoria_id,
    difficolta,
    domanda,
    risposta_corretta,
    risposta_errata_1,
    risposta_errata_2,
    risposta_errata_3
)
VALUES

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa misura il PIL di un Paese?',
'Il valore dei beni e servizi prodotti',
'Il numero di abitanti',
'La quantità di denaro posseduta dallo Stato',
'Il numero di aziende presenti'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Qual è la valuta ufficiale degli Stati Uniti?',
'Dollaro',
'Euro',
'Sterlina',
'Yen'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa significa inflazione?',
'Aumento generale dei prezzi',
'Diminuzione degli stipendi',
'Aumento della produzione industriale',
'Riduzione delle tasse'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Quale istituzione definisce la politica monetaria dell''Eurozona?',
'Banca Centrale Europea',
'Fondo Monetario Internazionale',
'Banca Mondiale',
'Commissione Europea'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa rappresenta il simbolo €?',
'L''euro',
'Il dollaro',
'La sterlina',
'Lo yen'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Che cosa indica il termine recessione?',
'Una diminuzione dell''attività economica',
'Un aumento dei prezzi delle azioni',
'Una crescita molto rapida',
'Una riduzione della popolazione'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Quale mercato permette lo scambio di azioni?',
'Borsa',
'Supermercato',
'Mercato immobiliare',
'Mercato del lavoro'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Quale indice misura l''andamento delle principali aziende quotate negli Stati Uniti?',
'S&P 500',
'FTSE MIB',
'DAX',
'Nikkei 225'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa significa IVA?',
'Imposta sul Valore Aggiunto',
'Indice del Valore Aziendale',
'Investimento Variabile Annuale',
'Interesse del Valore Attuale'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Quale organizzazione concede prestiti ai Paesi in difficoltà economiche?',
'Fondo Monetario Internazionale',
'FIFA',
'NATO',
'UNESCO'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa è uno stipendio?',
'Il compenso ricevuto per il lavoro',
'Una tassa',
'Un investimento',
'Un prestito bancario'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Che cosa indica il termine domanda in economia?',
'La quantità di beni che i consumatori vogliono acquistare',
'Il costo di produzione',
'La quantità di moneta stampata',
'Il numero di imprese'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Quale banca centrale italiana partecipa all''Eurosistema insieme alla BCE?',
'Banca d''Italia',
'INPS',
'ISTAT',
'Agenzia delle Entrate'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Che cosa rappresenta il debito pubblico?',
'Il debito accumulato dallo Stato',
'I debiti dei cittadini',
'Il valore delle esportazioni',
'La quantità di denaro nelle banche private'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa è un investimento?',
'L''impiego di denaro per ottenere un possibile rendimento',
'Una tassa obbligatoria',
'Un tipo di stipendio',
'Un prestito personale'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Quale economista ha elaborato la teoria della mano invisibile del mercato?',
'Adam Smith',
'Karl Marx',
'John Maynard Keynes',
'Milton Friedman'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa significa risparmiare?',
'Conservare una parte del proprio denaro',
'Spendere tutto il proprio denaro',
'Chiedere un prestito',
'Pagare una tassa'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Quale organizzazione pubblica dati statistici sull''economia italiana?',
'ISTAT',
'NASA',
'FIFA',
'Interpol'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa è una banca?',
'Un istituto che gestisce servizi finanziari',
'Un negozio di elettronica',
'Un ente sportivo',
'Un''azienda agricola'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Quale teoria economica è associata a John Maynard Keynes?',
'Intervento dello Stato nell''economia',
'Eliminazione totale del denaro',
'Fine del commercio internazionale',
'Ritorno al baratto'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa sono le tasse?',
'Pagamenti obbligatori allo Stato',
'Investimenti privati',
'Prestiti bancari',
'Stipendi pubblici'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Quale indice rappresenta la borsa italiana principale?',
'FTSE MIB',
'NASDAQ',
'Dow Jones',
'CAC 40'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa significa PIL?',
'Prodotto Interno Lordo',
'Prezzo Internazionale Locale',
'Piano Industriale Locale',
'Prodotto Importato Lordo'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Che cosa accade generalmente quando aumenta l''inflazione?',
'Il potere d''acquisto del denaro diminuisce',
'I prezzi diminuiscono sempre',
'I salari aumentano automaticamente',
'Le tasse vengono eliminate'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Quale settore comprende agricoltura e allevamento?',
'Settore primario',
'Settore secondario',
'Settore terziario',
'Settore finanziario'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Che cosa rappresenta il tasso di interesse?',
'Il costo del denaro preso in prestito',
'Il numero di banconote',
'Il valore di un''azienda',
'La quantità di prodotti venduti'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Quale valuta viene utilizzata nel Regno Unito?',
'Sterlina',
'Euro',
'Dollaro',
'Franco'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Che cosa significa monopolio?',
'Un mercato dominato da un solo venditore',
'Un mercato con molti concorrenti',
'Un mercato senza clienti',
'Una banca internazionale'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa è una criptovaluta?',
'Una valuta digitale basata sulla crittografia',
'Una moneta antica',
'Una banconota speciale',
'Un titolo di Stato'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Quale economista descrisse la divisione del lavoro usando il celebre esempio della fabbrica di spilli?',
'Adam Smith',
'David Ricardo',
'Karl Marx',
'John Maynard Keynes'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale economista pubblicò nel 1776 l''opera "La ricchezza delle nazioni"?',
'Adam Smith',
'David Ricardo',
'Thomas Malthus',
'John Maynard Keynes'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale istituzione internazionale fu creata dagli accordi di Bretton Woods con l''obiettivo di favorire la stabilità finanziaria mondiale?',
'Fondo Monetario Internazionale',
'Organizzazione Mondiale del Commercio',
'Banca dei Regolamenti Internazionali',
'OCSE'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale indice è comunemente chiamato "indice della paura" perché misura la volatilità attesa del mercato azionario statunitense?',
'VIX',
'S&P 500',
'Nasdaq Composite',
'Russell 2000'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale economista è considerato il principale teorico del monetarismo?',
'Milton Friedman',
'John Kenneth Galbraith',
'Paul Samuelson',
'Joseph Stiglitz'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Qual è l''obiettivo primario dell''Eurosistema secondo i trattati dell''Unione Europea?',
'Mantenere la stabilità dei prezzi',
'Finanziare direttamente i bilanci pubblici',
'Fissare le aliquote fiscali nazionali',
'Garantire la piena occupazione a qualsiasi livello di inflazione'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale indicatore confronta il PIL nominale con il PIL reale per misurare il livello dei prezzi della produzione interna?',
'Deflatore del PIL',
'Indice di Gini',
'Tasso di disoccupazione',
'Saldo commerciale'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale teoria economica attribuisce alla domanda aggregata un ruolo centrale nel determinare produzione e occupazione nel breve periodo?',
'Keynesismo',
'Mercantilismo',
'Monetarismo',
'Fisiocrazia'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale economista elaborò il principio del vantaggio comparato nel commercio internazionale?',
'David Ricardo',
'Adam Smith',
'Thomas Malthus',
'Alfred Marshall'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale indice misura la variazione dei prezzi di un paniere di beni e servizi acquistati dalle famiglie?',
'Indice dei Prezzi al Consumo',
'Indice Gini',
'PMI',
'Indice Nikkei'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale premio Nobel per l''Economia è noto per la teoria delle capacità (Capability Approach)?',
'Amartya Sen',
'Paul Krugman',
'Robert Solow',
'Gary Becker'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale mercato finanziario è specializzato nella negoziazione di obbligazioni?',
'Mercato obbligazionario',
'Mercato valutario',
'Mercato monetario',
'Mercato dei derivati'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale economista formulò la teoria della "distruzione creatrice"?',
'Joseph Schumpeter',
'Milton Friedman',
'Irving Fisher',
'John Hicks'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale indicatore statistico viene comunemente utilizzato per misurare la disuguaglianza nella distribuzione del reddito?',
'Indice di Gini',
'Indice Big Mac',
'Indice PMI',
'Indice VIX'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale organizzazione internazionale ha il compito principale di disciplinare il commercio mondiale?',
'Organizzazione Mondiale del Commercio',
'Fondo Monetario Internazionale',
'OCSE',
'Banca Mondiale'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale curva descrive tradizionalmente una relazione inversa tra inflazione e disoccupazione nel breve periodo?',
'Curva di Phillips',
'Curva di Laffer',
'Curva di Lorenz',
'Curva di Engel'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa rappresenta un''azione di una società?',
'Una quota del suo capitale',
'Un prestito con rimborso garantito',
'Una tassa sui suoi prodotti',
'Una fattura non ancora pagata'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Come si chiama la differenza positiva tra ricavi e costi di un''impresa?',
'Utile',
'Fatturato',
'Debito',
'Capitale sociale'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa indica il termine esportazione?',
'La vendita di beni o servizi all''estero',
'L''acquisto di beni dall''estero',
'Il trasferimento tra magazzini nazionali',
'Il pagamento dei salari'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa rappresenta il tasso di cambio?',
'Il prezzo di una valuta espresso in un''altra',
'Il rendimento medio delle azioni',
'La percentuale di disoccupati',
'L''aumento annuo dei salari'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'In quale settore economico rientrano normalmente turismo e trasporti?',
'Terziario',
'Primario',
'Secondario',
'Estrattivo'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa indica il potere d''acquisto di una somma di denaro?',
'La quantità di beni e servizi che consente di comprare',
'Il numero di banconote che la compone',
'Il tasso di interesse fissato dalla banca',
'Il valore dei soli beni esportati'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Come si chiama un mercato con pochi grandi venditori?',
'Oligopolio',
'Monopsonio',
'Concorrenza perfetta',
'Monopolio naturale'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Che cosa registra il fatturato di un''impresa?',
'I ricavi delle vendite e delle prestazioni',
'L''utile dopo tutte le imposte',
'Il denaro disponibile in cassa in ogni momento',
'Il solo valore dei macchinari'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Quale costo resta invariato al variare della quantità prodotta entro una data capacità produttiva?',
'Costo fisso',
'Costo variabile totale',
'Costo marginale',
'Costo medio variabile'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'facile',
'Se un prodotto costa 80 euro e viene scontato del 25%, quale prezzo si paga?',
'60 euro',
'55 euro',
'65 euro',
'75 euro'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Che cosa rappresenta il costo opportunità di una scelta?',
'Il valore della migliore alternativa a cui si rinuncia',
'La somma di tutte le spese già sostenute',
'Il prezzo più basso disponibile sul mercato',
'Il costo delle sole materie prime'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Quale situazione descrive un''esternalità negativa?',
'Un''attività impone costi a terzi senza compensarli',
'Un''impresa riduce volontariamente il prezzo',
'Un consumatore risparmia parte del reddito',
'Un produttore acquista nuove attrezzature'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Che cosa distingue il PIL reale dal PIL nominale?',
'Corregge gli effetti delle variazioni dei prezzi',
'Esclude sempre tutti i servizi',
'Comprende solo le esportazioni',
'Misura esclusivamente la produzione pubblica'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Che cosa si intende per interesse composto?',
'Gli interessi maturati producono a loro volta interessi',
'Il tasso resta sempre uguale all''inflazione',
'Gli interessi vengono pagati solo in beni',
'Il capitale viene rimborsato prima degli interessi'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Quale voce è un''attività nello stato patrimoniale di un''impresa?',
'Un credito verso un cliente',
'Un debito verso un fornitore',
'Un mutuo da restituire',
'Un''imposta ancora da versare'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Come si chiama l''aumento generalizzato dei prezzi accompagnato da stagnazione economica?',
'Stagflazione',
'Deflazione',
'Disinflazione',
'Espansione'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Che cosa si verifica nel punto di pareggio di un''impresa?',
'I ricavi totali eguagliano i costi totali',
'I ricavi sono necessariamente nulli',
'I costi variabili scompaiono',
'Il profitto raggiunge sempre il massimo'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Quale differenza viene misurata dalla bilancia commerciale delle merci?',
'Esportazioni meno importazioni di beni',
'Entrate fiscali meno spese pubbliche',
'Risparmio privato meno consumi',
'Prestiti bancari meno depositi'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Quale caratteristica distingue un bene pubblico puro?',
'È non rivale e non escludibile',
'È sempre prodotto da un''impresa privata',
'Ha sempre prezzo pari al costo marginale',
'Può essere consumato da una sola persona'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'medio',
'Se il prezzo di un bene cresce del 10% e la quantità domandata diminuisce del 20%, quanto vale in valore assoluto l''elasticità calcolata come rapporto tra queste variazioni percentuali?',
'2',
'0,5',
'1',
'10'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale problema descrive la selezione avversa?',
'Informazioni nascoste prima di un contratto alterano la composizione dei partecipanti',
'Comportamenti nascosti dopo un contratto modificano gli incentivi',
'Prezzi identici eliminano tutti i concorrenti',
'Costi fissi crescenti riducono la produzione'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale economista illustrò le asimmetrie informative con il mercato delle auto usate nel saggio The Market for Lemons?',
'George Akerlof',
'Paul Samuelson',
'Robert Solow',
'Gary Becker'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Nel modello di Solow senza progresso tecnologico, che cosa accade al prodotto per lavoratore nello stato stazionario?',
'Rimane costante',
'Cresce indefinitamente a tasso crescente',
'Diventa necessariamente nullo',
'Oscilla sempre tra due valori'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale teorema collega la contrattazione sui diritti di proprietà a un esito efficiente in assenza di costi di transazione e sotto le sue altre ipotesi?',
'Teorema di Coase',
'Teorema di Bayes',
'Teorema di Arrow sull''impossibilità',
'Teorema di Modigliani-Miller'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Che cosa misura il saggio marginale di sostituzione tra due beni?',
'Quanto di un bene si cede per un''unità aggiuntiva dell''altro a utilità costante',
'La variazione del profitto al variare del salario',
'Il rapporto tra imposte e reddito nazionale',
'La quota di reddito risparmiata'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale condizione definisce un equilibrio di Nash?',
'Nessun giocatore migliora cambiando da solo strategia',
'Tutti i giocatori ottengono lo stesso risultato',
'Il risultato massimizza sempre il benessere collettivo',
'Ogni giocatore conosce le mosse future con certezza'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Che cosa descrive la trappola della liquidità nel modello keynesiano tradizionale?',
'Una situazione in cui aumentare la moneta non riduce ulteriormente il tasso d''interesse',
'Una situazione in cui tutte le banche esauriscono le riserve',
'Un divieto di prelevare contante imposto ai cittadini',
'Un sistema in cui il tasso di cambio è sempre fisso'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale criterio migliora l''allocazione di risorse se qualcuno sta meglio e nessuno sta peggio?',
'Miglioramento paretiano',
'Compensazione di Kaldor-Hicks soltanto potenziale',
'Massimizzazione del fatturato',
'Minimizzazione dei salari'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale identità esprime il risparmio nazionale in un''economia aperta, indicando con I gli investimenti e con CA il saldo delle partite correnti?',
'S = I + CA',
'S = I − CA',
'S = CA − I',
'S = I × CA'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale economista associò lo sviluppo economico al modello di un settore tradizionale con offerta illimitata di lavoro?',
'W. Arthur Lewis',
'Robert Lucas',
'Wassily Leontief',
'Jan Tinbergen'
);

COMMIT;
