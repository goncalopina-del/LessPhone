-- ============================================================
-- Present App — Seed Data: 15 curated rituals, 10 languages
-- Run: supabase db execute --file supabase/seed/seed.sql
-- ============================================================

INSERT INTO public.rituals (title_i18n, description_i18n, category, duration_min, time_of_day, season, is_system) VALUES

(
  '{"pt-PT":"Jantar sem ecrãs","pt-BR":"Jantar sem telas","en":"Screen-free dinner","zh":"无手机晚餐","hi":"बिना स्क्रीन का रात का खाना","es":"Cena sin pantallas","ar":"عشاء بدون شاشات","fr":"Dîner sans écrans","bn":"পর্দা মুক্ত রাতের খাবার","ru":"Ужин без экранов","id":"Makan malam tanpa layar"}',
  '{"pt-PT":"Todos os telemóveis ficam na cozinha.","en":"All phones stay in the kitchen.","es":"Todos los móviles se quedan en la cocina."}',
  'meal', 45, ARRAY['evening'], ARRAY['spring','summer','autumn','winter'], true
),
(
  '{"pt-PT":"Cozinhar juntos","pt-BR":"Cozinhar juntos","en":"Cook together","zh":"一起做饭","hi":"साथ मिलकर खाना बनाना","es":"Cocinar juntos","ar":"الطبخ معاً","fr":"Cuisiner ensemble","bn":"একসাথে রান্না করা","ru":"Готовить вместе","id":"Memasak bersama"}',
  '{"pt-PT":"Escolham uma receita nova.","en":"Pick a new recipe and cook it together."}',
  'meal', 60, ARRAY['evening','afternoon'], ARRAY['spring','summer','autumn','winter'], true
),
(
  '{"pt-PT":"Passeio em família","pt-BR":"Passeio em família","en":"Family walk","zh":"家庭散步","hi":"पारिवारिक सैर","es":"Paseo familiar","ar":"نزهة عائلية","fr":"Promenade en famille","bn":"পারিবারিক হাঁটা","ru":"Семейная прогулка","id":"Jalan-jalan keluarga"}',
  '{"pt-PT":"30 minutos a caminhar sem destino fixo.","en":"30 minutes walking with no fixed destination."}',
  'outdoor', 30, ARRAY['morning','afternoon','evening'], ARRAY['spring','summer','autumn'], true
),
(
  '{"pt-PT":"Observar as estrelas","pt-BR":"Observar as estrelas","en":"Stargazing","zh":"观星","hi":"तारे देखना","es":"Observar las estrellas","ar":"مراقبة النجوم","fr":"Observer les étoiles","bn":"তারা দেখা","ru":"Наблюдать за звёздами","id":"Mengamati bintang"}',
  '{"pt-PT":"Identifiquem constelações juntos.","en":"Identify constellations together."}',
  'outdoor', 45, ARRAY['evening'], ARRAY['summer','spring'], true
),
(
  '{"pt-PT":"Picnic no parque","pt-BR":"Piquenique no parque","en":"Park picnic","zh":"公园野餐","hi":"पार्क में पिकनिक","es":"Picnic en el parque","ar":"نزهة في الحديقة","fr":"Pique-nique au parc","bn":"পার্কে পিকনিক","ru":"Пикник в парке","id":"Piknik di taman"}',
  '{"pt-PT":"Preparem a comida juntos em casa.","en":"Prepare food together at home."}',
  'outdoor', 120, ARRAY['afternoon'], ARRAY['spring','summer'], true
),
(
  '{"pt-PT":"Jogo de tabuleiro","pt-BR":"Jogo de tabuleiro","en":"Board game","zh":"桌游","hi":"बोर्ड गेम","es":"Juego de mesa","ar":"لعبة طاولة","fr":"Jeu de société","bn":"বোর্ড গেম","ru":"Настольная игра","id":"Permainan papan"}',
  '{"pt-PT":"Escolham um jogo que toda a gente goste.","en":"Pick a game everyone enjoys."}',
  'indoor', 60, ARRAY['evening','afternoon'], ARRAY['spring','summer','autumn','winter'], true
),
(
  '{"pt-PT":"Noite de filmes em família","pt-BR":"Noite de filmes em família","en":"Family movie night","zh":"家庭电影之夜","hi":"पारिवारिक फिल्म रात","es":"Noche de película en familia","ar":"ليلة أفلام عائلية","fr":"Soirée film en famille","bn":"পারিবারিক চলচ্চিত্র রাত","ru":"Семейный киновечер","id":"Malam film keluarga"}',
  '{"pt-PT":"Cada um sugere um filme.","en":"Everyone suggests a film."}',
  'indoor', 120, ARRAY['evening'], ARRAY['spring','summer','autumn','winter'], true
),
(
  '{"pt-PT":"Puzzles em família","pt-BR":"Quebra-cabeça em família","en":"Family puzzle","zh":"拼图","hi":"परिवार के साथ पहेली","es":"Puzzle en familia","ar":"أحجية عائلية","fr":"Puzzle en famille","bn":"পারিবারিক পাজল","ru":"Семейный пазл","id":"Puzzle keluarga"}',
  '{"pt-PT":"Escolham um puzzle desafiante.","en":"Pick a challenging puzzle."}',
  'indoor', 90, ARRAY['afternoon','evening'], ARRAY['autumn','winter'], true
),
(
  '{"pt-PT":"Conversa de qualidade","pt-BR":"Conversa de qualidade","en":"Quality conversation","zh":"深度对话","hi":"गुणवत्तापूर्ण बातचीत","es":"Conversación de calidad","ar":"محادثة ذات جودة","fr":"Conversation de qualité","bn":"মানসম্পন্ন কথোপকথন","ru":"Разговор по душам","id":"Percakapan berkualitas"}',
  '{"pt-PT":"Cartas de perguntas — cada um tira uma.","en":"Question cards — everyone draws one."}',
  'indoor', 30, ARRAY['evening'], ARRAY['spring','summer','autumn','winter'], true
),
(
  '{"pt-PT":"Desenho em família","pt-BR":"Desenho em família","en":"Family drawing","zh":"家庭绘画","hi":"पारिवारिक चित्रकला","es":"Dibujo en familia","ar":"الرسم العائلي","fr":"Dessin en famille","bn":"পারিবারিক আঁকা","ru":"Семейный рисунок","id":"Menggambar keluarga"}',
  '{"pt-PT":"Papel e canetas para todos.","en":"Paper and pens for everyone."}',
  'creative', 45, ARRAY['afternoon','evening'], ARRAY['spring','summer','autumn','winter'], true
),
(
  '{"pt-PT":"Construção com o que há em casa","pt-BR":"Construção com o que há em casa","en":"Build with what''s at home","zh":"用家里的东西建造","hi":"घर में मौजूद चीजों से बनाना","es":"Construir con lo que hay en casa","ar":"البناء بما هو متاح في المنزل","fr":"Construire avec ce qu''on a à la maison","bn":"বাড়ির জিনিস দিয়ে তৈরি করা","ru":"Строить из того, что есть дома","id":"Membangun dengan apa yang ada di rumah"}',
  '{"pt-PT":"Desafio: a estrutura mais alta em 20 minutos.","en":"Challenge: tallest structure in 20 minutes."}',
  'creative', 30, ARRAY['afternoon'], ARRAY['spring','summer','autumn','winter'], true
),
(
  '{"pt-PT":"Escrever uma história coletiva","pt-BR":"Escrever uma história coletiva","en":"Write a story together","zh":"共同写故事","hi":"मिलकर कहानी लिखना","es":"Escribir una historia juntos","ar":"كتابة قصة مشتركة","fr":"Écrire une histoire ensemble","bn":"একসাথে গল্প লেখা","ru":"Писать историю вместе","id":"Menulis cerita bersama"}',
  '{"pt-PT":"Um começa uma frase, o próximo continua.","en":"One person starts a sentence, the next continues."}',
  'creative', 30, ARRAY['evening','afternoon'], ARRAY['spring','summer','autumn','winter'], true
),
(
  '{"pt-PT":"Leitura em voz alta","pt-BR":"Leitura em voz alta","en":"Read aloud","zh":"大声朗读","hi":"जोर से पढ़ना","es":"Leer en voz alta","ar":"القراءة بصوت عالٍ","fr":"Lire à voix haute","bn":"জোরে পড়া","ru":"Читать вслух","id":"Membaca dengan suara keras"}',
  '{"pt-PT":"Um membro lê um capítulo em voz alta.","en":"A family member reads a chapter aloud."}',
  'reading', 20, ARRAY['evening'], ARRAY['spring','summer','autumn','winter'], true
),
(
  '{"pt-PT":"Clube do livro familiar","pt-BR":"Clube do livro familiar","en":"Family book club","zh":"家庭读书俱乐部","hi":"पारिवारिक पुस्तक क्लब","es":"Club de lectura familiar","ar":"نادي القراءة العائلي","fr":"Club de lecture familial","bn":"পারিবারিক বই ক্লাব","ru":"Семейный книжный клуб","id":"Klub buku keluarga"}',
  '{"pt-PT":"Escolham um livro para ler ao longo do mês.","en":"Pick a book to read over the month."}',
  'reading', 30, ARRAY['evening'], ARRAY['spring','summer','autumn','winter'], true
),
(
  '{"pt-PT":"Pequeno-almoço especial de fim de semana","pt-BR":"Café da manhã especial de fim de semana","en":"Special weekend breakfast","zh":"周末特别早餐","hi":"सप्ताहांत विशेष नाश्ता","es":"Desayuno especial de fin de semana","ar":"فطور عطلة نهاية الأسبوع المميز","fr":"Petit-déjeuner spécial week-end","bn":"সপ্তাহান্তের বিশেষ নাস্তা","ru":"Особый завтрак выходного дня","id":"Sarapan spesial akhir pekan"}',
  '{"pt-PT":"Pancakes, waffles ou o prato favorito.","en":"Pancakes, waffles or the family favourite."}',
  'meal', 60, ARRAY['morning'], ARRAY['spring','summer','autumn','winter'], true
);
