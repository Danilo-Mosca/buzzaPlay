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
'Quale impero aveva Costantinopoli come capitale?',
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
'Quale esploratore completò la prima circumnavigazione del globo?',
'Ferdinando Magellano',
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
'Chi realizzò la scultura del Baldacchino di San Pietro?',
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
'facile',
'Quale artista dipinse il soffitto della Cappella Sistina?',
'Michelangelo',
'Raffaello',
'Caravaggio',
'Leonardo'
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
'Tailandia'
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
'San Paolo',
'São Paulo'
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
'Quale Stato americano è famoso per la città di New York?',
'Stati Uniti',
'Canada',
'Messico',
'Brasile'
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
'Quanti punti vale un canestro da tre punti nel basket?',
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
'Quale tennista ha vinto più titoli del Grande Slam maschili?',
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
'Quale pilota ha vinto sette titoli mondiali di Formula 1?',
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
'Quale nazionale ha vinto più Coppe del Mondo di calcio?',
'Brasile',
'Italia',
'Germania',
'Argentina'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale sport pratica Michael Jordan?',
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
'Quale sport pratica Valentino Rossi?',
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
'Quale atleta italiana ha vinto l''oro olimpico nei 100 metri a Tokyo 2020?',
'Marcell Jacobs',
'Gianmarco Tamberi',
'Filippo Tortu',
'Usain Bolt'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'facile',
'Quale sport è associato alla Coppa America?',
'Calcio',
'Basket',
'Tennis',
'Rugby'
),

(
(SELECT id FROM categorie WHERE nome = 'Sport'),
'medio',
'Quale squadra ha vinto più Champions League nella storia?',
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
'Quale saga cinematografica racconta la lotta tra vampiri e licantropi?',
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
'Quale compositore ha scritto la Nona Sinfonia?',
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
'Chi è l''autore dell''opera Le quattro stagioni?',
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
'Quale gruppo italiano ha cantato L''italiano?',
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
'medio',
'Chi è l''autore della Divina Commedia, opera divisa in Inferno, Purgatorio e Paradiso?',
'Dante Alighieri',
'Virgilio',
'Omero',
'Petrarca'
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
'Quale personaggio è protagonista del romanzo Robinson Crusoe?',
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
'Chi è considerato il fondatore di Microsoft?',
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
'Quale motore di ricerca è sviluppato da Google?',
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
'Quale dispositivo permette di collegare più computer in rete?',
'Router',
'Scanner',
'Webcam',
'Microfono'
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
'Chi è il protagonista dei fumetti di Topolino?',
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
'Chi ha creato il personaggio di Spider-Man?',
'Stan Lee',
'Walt Disney',
'Osamu Tezuka',
'Hayao Miyazaki'
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
'Quale animale è il protagonista del cartone Tom & Jerry?',
'Jerry',
'Tom',
'Spike',
'Topolino'
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
'Quale cartone racconta le avventure di quattro tartarughe ninja?',
'Tartarughe Ninja',
'Pokemon',
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
'In quale gioco bisogna catturare creature chiamate Pokémon?',
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
'Quale software house ha creato Grand Theft Auto?',
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
'Quale azienda ha creato la console Nintendo Switch?',
'Nintendo',
'Sony',
'Microsoft',
'Sega'
),

(
(SELECT id FROM categorie WHERE nome = 'Videogiochi'),
'facile',
'Quale gioco è famoso per il personaggio Pac-Man?',
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
'Quale casa produttrice ha creato la saga Final Fantasy?',
'Square Enix',
'Capcom',
'Konami',
'Bethesda'
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
'Quale istituzione europea ha sede a Bruxelles?',
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
'Quale città ospita il Parlamento europeo?',
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
'Quale Paese è famoso per il sistema politico della Casa Bianca?',
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
'Qual è la capitale della Francia?',
'Parigi',
'Lione',
'Marsiglia',
'Nizza'
),

(
(SELECT id FROM categorie WHERE nome = 'Politica'),
'medio',
'Quale Stato ha il sistema politico chiamato "Repubblica Federale"?',
'Germania',
'Italia',
'Grecia',
'Portogallo'
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
'Quale potere dello Stato applica le leggi?',
'Potere giudiziario',
'Potere esecutivo',
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
'Quale Paese è entrato nell''Unione Europea nel 2023 insieme alla Croazia?',
'Nessun altro Paese',
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
'Quale accordo internazionale mira a contrastare il cambiamento climatico?',
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
'Quale città ospita la sede dell''Unione Europea?',
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
'Quale organizzazione coordina gli aiuti umanitari internazionali?',
'ONU',
'FIFA',
'OCSE',
'Interpol'
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
'Quale continente ospiterà i Mondiali di calcio 2026?',
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
'Quale istituzione emette l''euro?',
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
'Quale istituzione italiana gestisce la politica monetaria insieme alla BCE?',
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
'John Keynes',
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
'Quale economista è associato alla teoria del capitalismo?',
'Adam Smith',
'Charles Darwin',
'Albert Einstein',
'Sigmund Freud'
);

COMMIT;