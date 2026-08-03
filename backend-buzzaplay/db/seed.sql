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
'Quale fu il principale artefice delle riforme che portarono alla Restaurazione Meiji in Giappone?',
'Mutsuhito',
'Tokugawa Ieyasu',
'Toyotomi Hideyoshi',
'Oda Nobunaga'
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
'Quale stato europeo diede origine alla dinastia degli Asburgo?',
'Ducato d''Austria',
'Regno d''Ungheria',
'Regno di Boemia',
'Ducato di Baviera'
),

(
(SELECT id FROM categorie WHERE nome = 'Storia'),
'difficile',
'Quale conferenza del 1945 stabilì gran parte dell''assetto dell''Europa nel dopoguerra?',
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
'Quale città fu la prima capitale dell''Impero ottomano?',
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
'Quale capitale europea è attraversata contemporaneamente dal Danubio e dal Canale Danubio-Meno-Reno?',
'Vienna',
'Bratislava',
'Budapest',
'Belgrado'
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
'Quale vitamina è sintetizzata principalmente grazie all''esposizione della pelle ai raggi UVB?',
'Vitamina D',
'Vitamina A',
'Vitamina K',
'Vitamina E'
),

(
(SELECT id FROM categorie WHERE nome = 'Scienze'),
'difficile',
'Quale gas costituisce circa il 78% dell''atmosfera terrestre?',
'Azoto',
'Ossigeno',
'Argon',
'Anidride carbonica'
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
'Quale pianeta del Sistema Solare possiede il maggior numero di satelliti naturali conosciuti?',
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
'Quale disciplina NON fa parte del pentathlon moderno?',
'Tiro con l''arco',
'Scherma',
'Nuoto',
'Equitazione'
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
'Quale film di Stanley Kubrick è tratto dal romanzo "Il dottor Stranamore"?',
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
'Quale gruppo pubblicò nel 1973 l''album "The Dark Side of the Moon"?',
'Pink Floyd',
'Genesis',
'Yes',
'King Crimson'
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
'Quale autore scrisse il romanzo "Il nome della rosa"?',
'Umberto Eco',
'Leonardo Sciascia',
'Italo Calvino',
'Primo Levi'
),

(
(SELECT id FROM categorie WHERE nome = 'Letteratura'),
'difficile',
'Quale tragedia di Shakespeare racconta la congiura contro Giulio Cesare?',
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
'Quale linguaggio di programmazione fu progettato da Bjarne Stroustrup come evoluzione del linguaggio C?',
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
'Quale sistema operativo introdusse per primo il concetto moderno di kernel Linux?',
'GNU/Linux',
'MINIX',
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
'Quale protocollo è progettato specificamente per il trasferimento sicuro di file come estensione di SSH?',
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
'Quale dei seguenti NON è uno dei sette nani della fiaba di Biancaneve?',
'Felice',
'Pisolo',
'Brontolo',
'Eolo'
),

(
(SELECT id FROM categorie WHERE nome = 'Fumetti, favole e cartoni'),
'difficile',
'Quale studio di animazione ha prodotto il film "La città incantata"?',
'Studio Ghibli',
'Toei Animation',
'Madhouse',
'Kyoto Animation'
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
'Quale film Disney fu il primo lungometraggio animato della storia?',
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
'Quale film Pixar vinse l''Oscar come miglior film d''animazione nel 2003?',
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
'Quale principessa Disney è ispirata alla leggenda cinese di Hua Mulan?',
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
'Quale gioco è considerato il primo grande MMORPG commerciale a raggiungere enorme successo mondiale nei primi anni 2000?',
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
'Come si chiama l''attuale forma istituzionale della Repubblica francese?',
'Quinta Repubblica',
'Terza Repubblica',
'Quarta Repubblica',
'Sesta Repubblica'
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
'Quale organo dell''Unione Europea detiene il monopolio dell''iniziativa legislativa?',
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
'In quale anno entrò in vigore la Costituzione della Repubblica Italiana?',
'1948',
'1946',
'1947',
'1949'
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
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale accordo internazionale del 2015 ha come obiettivo principale il contenimento del riscaldamento globale?',
'Accordo di Parigi',
'Protocollo di Kyoto',
'Agenda 2030',
'Convenzione di Rio'
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
'Quale programma spaziale ha riportato esseri umani sulla Luna dopo il programma Apollo?',
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
'Quale metallo è considerato fondamentale per la produzione delle moderne batterie agli ioni di litio?',
'Litio',
'Nichel',
'Rame',
'Alluminio'
),

(
(SELECT id FROM categorie WHERE nome = 'Attualità'),
'difficile',
'Quale tecnologia utilizza un registro distribuito e immutabile per registrare le transazioni?',
'Blockchain',
'Cloud Computing',
'Virtualizzazione',
'Edge Computing'
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
'Quale continente produce la maggiore quantità di terre rare estratte a livello mondiale?',
'Asia',
'Africa',
'Europa',
'Oceania'
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
'Quale indice rappresenta l''andamento delle 500 principali società quotate negli Stati Uniti?',
'S&P 500',
'Dow Jones Transportation Average',
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
'Quale banca centrale è responsabile della politica monetaria dell''Eurozona?',
'Banca Centrale Europea',
'Bundesbank',
'Banca d''Italia',
'Banca Europea per gli Investimenti'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale indicatore misura il valore complessivo dei beni e servizi prodotti all''interno di un Paese in un determinato periodo?',
'Prodotto Interno Lordo',
'Reddito Nazionale Lordo',
'Indice dei Prezzi al Consumo',
'Deflatore del PIL'
),

(
(SELECT id FROM categorie WHERE nome = 'Economia'),
'difficile',
'Quale teoria economica sostiene che la domanda aggregata sia il principale motore della crescita economica?',
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
);

COMMIT;