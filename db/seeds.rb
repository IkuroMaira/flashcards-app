# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# frozen_string_literal: true

# ============================================================
# Flashcards Seeds
# Généré à partir des fiches .md OBSIMUNDIA & OBSINOTES
# ============================================================

rails_deck    = Deck.find_or_create_by!(name: "Rails")
fastapi_deck  = Deck.find_or_create_by!(name: "FastAPI & Python")
react_deck    = Deck.find_or_create_by!(name: "JavaScript & React")
general_deck  = Deck.find_or_create_by!(name: "Général")

DECK_MAP = {
  "Rails"               => rails_deck,
  "FastAPI & Python"    => fastapi_deck,
  "JavaScript & React"  => react_deck,
  "Général"             => general_deck
}.freeze

cards = [
  # ──────────────────────────────────────────────────
  # DECK : Rails — Formulaires & HTTP
  # ──────────────────────────────────────────────────
  { question: "Quels sont les deux attributs clés d'une balise <form> en HTML ?", answer: "1) `action` : l'URL de destination (ex: /users)\n2) `method` : le verbe HTTP (GET ou POST)", category: "Rails", deck: "Rails" },
  { question: "Comment Rails simule-t-il les verbes PATCH, PUT et DELETE alors que HTML ne supporte que GET et POST ?", answer: "Rails ajoute un champ caché : <input type=\"hidden\" name=\"_method\" value=\"patch\" />", category: "Rails", deck: "Rails" },
  { question: "Quelle est la différence entre GET et POST pour l'envoi de données ?", answer: "GET : données dans l'URL (?name=Alice), pour recherche/filtrage.\nPOST : données dans le corps de la requête, pour création/modification.\nGET est visible, POST est caché.", category: "Rails", deck: "Rails" },

  # ──────────────────────────────────────────────────
  # DECK : Rails — Hotwire / Turbo
  # ──────────────────────────────────────────────────
  { question: "Quels sont les 3 outils qui composent Hotwire ?", answer: "1) Turbo : navigation et mises à jour du DOM sans JS custom\n2) Stimulus : framework JS léger pour les interactions\n3) Strada : connexion avec apps mobiles natives (optionnel)", category: "Rails", deck: "Rails" },
  { question: "Quels sont les 3 composants de Turbo et leur rôle ?", answer: "1) Turbo Drive : intercepte liens/formulaires, remplace le <body> sans rechargement\n2) Turbo Frames : met à jour une portion de page\n3) Turbo Streams : instructions précises pour modifier le DOM (append, replace...)", category: "Rails", deck: "Rails" },
  { question: "Quelles sont les 7 actions Turbo Stream ?", answer: "append (fin), prepend (début), replace (élément entier), update (contenu intérieur), remove (supprime), before (avant), after (après)", category: "Rails", deck: "Rails" },
  { question: "Quels codes HTTP sont importants pour Turbo Stream ?", answer: "200 : succès\n303 : redirection (succès)\n422 : erreur (unprocessable_entity)", category: "Rails", deck: "Rails" },
  { question: "Pourquoi faut-il mettre `return` avant `render` dans un controller avec Turbo ?", answer: "Sans `return`, Rails continue l'exécution et peut atteindre un second `render`, provoquant une DoubleRenderError.", category: "Rails", deck: "Rails" },

  # ──────────────────────────────────────────────────
  # DECK : Rails — Tests (RSpec, Capybara, FactoryBot)
  # ──────────────────────────────────────────────────
  { question: "Quelle est la pyramide des tests et ses 3 niveaux ?", answer: "Base : tests unitaires (rapides, nombreux, spec/models/)\nMilieu : tests d'intégration (moyens, spec/requests/)\nSommet : tests E2E (lents, peu nombreux, spec/features/)", category: "RSpec", deck: "Rails" },
  { question: "Comment lancer un test RSpec sur une ligne spécifique d'un fichier ?", answer: "bundle exec rspec spec/models/user_spec.rb:42\nOn ajoute :numéro_de_ligne après le chemin du fichier.", category: "RSpec", deck: "Rails" },
  { question: "Qu'est-ce que Capybara et à quoi sert-il ?", answer: "Outil pour simuler un navigateur dans les tests E2E. Il permet de remplir des champs, cliquer sur des boutons et vérifier le contenu affiché.", category: "RSpec", deck: "Rails" },
  { question: "Pourquoi faut-il utiliser `have_text` plutôt que `element.text` dans Capybara ?", answer: "`expect(page).to have_text(\"Message\")` attend automatiquement que le texte apparaisse (retry).\n`expect(element.text).to include(\"Message\")` ne fait aucune attente.", category: "RSpec", deck: "Rails" },
  { question: "À quoi sert `within` dans Capybara ?", answer: "Il limite la portée des actions à un élément précis :\nwithin \"[data-test='form']\" do\n  fill_in \"Email\", with: \"test@example.com\"\nend", category: "RSpec", deck: "Rails" },
  { question: "Qu'est-ce que le pattern Page Object (SitePrism) et son avantage ?", answer: "Représenter chaque page comme une classe Ruby pour centraliser les sélecteurs CSS. Si le HTML change, un seul fichier à modifier au lieu de tous les tests.", category: "RSpec", deck: "Rails" },
  { question: "Qu'est-ce qu'un test flaky et quelles sont ses 4 causes principales ?", answer: "Test qui passe parfois et échoue parfois sans changement de code.\nCauses : 1) Timing 2) Scroll (élément hors écran) 3) État résiduel 4) Animations CSS", category: "RSpec", deck: "Rails" },
  { question: "Quelle est la différence entre `create`, `build` et `create_list` dans FactoryBot ?", answer: "`create(:user)` : crée et sauvegarde en BDD\n`build(:user)` : crée en mémoire sans sauvegarder\n`create_list(:user, 5)` : crée 5 instances sauvegardées", category: "RSpec", deck: "Rails" },
  { question: "Qu'est-ce qu'un trait dans FactoryBot ?", answer: "Une variante nommée d'une factory avec des attributs ou callbacks spécifiques. Usage : `create(:booking, :paid, :with_availability)`. Permet de combiner plusieurs variantes.", category: "RSpec", deck: "Rails" },
  { question: "Quelle est la différence entre `let` et `let!` dans RSpec ?", answer: "`let` : lazy, l'objet est créé à la première utilisation.\n`let!` : l'objet est créé immédiatement avant chaque test.\nUtiliser `let!` quand la donnée doit exister avant le test.", category: "RSpec", deck: "Rails" },
  { question: "Quelles sont les 4 règles pour écrire de bons tests ?", answer: "1) Un test = une assertion principale\n2) Données isolées : chaque test crée ses propres données\n3) Pas de dépendance entre tests\n4) Nommer explicitement ce qui est testé", category: "RSpec", deck: "Rails" },
  { question: "Quelle est la différence entre expect { bloc } et expect(valeur) en RSpec ?", answer: "expect { bloc } vérifie un CHANGEMENT (avant/après) : expect { action }.to change(Model, :count).by(1). expect(valeur) vérifie une valeur à un instant T.", category: "RSpec", deck: "Rails" },
  { question: "Pourquoi ne pas utiliser sleep dans les tests Capybara ?", answer: "Les matchers Capybara (have_text, have_css) ont un timeout intégré et réessaient automatiquement. sleep est fragile et ralentit les tests.", category: "RSpec", deck: "Rails" },
  { question: "Quelle est la structure d'un test RSpec ?", answer: "RSpec.describe Classe do / describe '#methode' do / context 'quand...' do / it 'fait qqch' do / expect(result).to eq(attendu). Convention : # pour instance, . pour méthode de classe.", category: "RSpec", deck: "Rails" },
  { question: "Quels sont les matchers RSpec les plus courants ?", answer: "Égalité : eq, be. Type : be_a. Booléen : be_truthy, be_falsey, be_nil. Collection : include, be_empty. Exception : raise_error. Changement : change { }.by(n).", category: "RSpec", deck: "Rails" },
  { question: "Qu'est-ce qu'un double en RSpec ?", answer: "Un double simule un objet pour isoler les tests. allow(double).to receive(:methode).and_return(valeur) configure le comportement. instance_double vérifie que les méthodes existent.", category: "RSpec", deck: "Rails" },
  { question: "Quelle différence entre shared_examples et shared_context en RSpec ?", answer: "shared_examples = tests partagés réutilisables (include_examples). shared_context = setup partagé (let, before) utilisé avec include_context.", category: "RSpec", deck: "Rails" },

  # ──────────────────────────────────────────────────
  # DECK : Rails — Pundit / Autorisation
  # ──────────────────────────────────────────────────
  { question: "Quels sont les 4 piliers pour qu'un controller Rails fonctionne avec Pundit ?", answer: "1) Héritage de ApplicationController\n2) Route correspondant au controller\n3) Utiliser `authorize` (pas d'appel direct à la policy)\n4) Vue dans app/views/<namespace>/<controller>/", category: "Rails", deck: "Rails" },
  { question: "Comment fonctionne `authorize` avec Pundit dans un controller ?", answer: "Pundit cherche automatiquement `nom_action?` dans la policy. Appel explicite :\n`authorize objet, :methode_policy?, policy_class: LaPolicy`\n3 arguments : l'objet, la méthode, la classe de policy.", category: "Rails", deck: "Rails" },

  # ──────────────────────────────────────────────────
  # DECK : Rails — Ruby (langage)
  # ──────────────────────────────────────────────────
  { question: "Quelle est la différence entre un Symbol et un String en Ruby ?", answer: "Symbol (:user) : immuable, unique en mémoire, rapide en comparaison, pour les identifiants internes.\nString (\"user\") : modifiable, recréé à chaque usage, pour le texte affiché.", category: "Ruby", deck: "Rails" },
  { question: "À quoi sert le raccourci `%i[]` en Ruby ?", answer: "Il crée un tableau de Symbols sans écrire les `:`.\n`%i[index show create]` équivaut à `[:index, :show, :create]`.\nTrès utilisé dans les routes Rails.", category: "Ruby", deck: "Rails" },
  { question: "Quelles sont les 4 alternatives idiomatiques en Ruby pour la performance ?", answer: "`(a + b).uniq` → `a | b`\n`array.select{}.length` → `array.count{}`\n`array.map{}.flatten` → `array.flat_map{}`\n`hash.keys.include?(key)` → `hash.key?(key)`", category: "Ruby", deck: "Rails" },
  { question: "Qu'est-ce que le Garbage Collector en Ruby ?", answer: "Mécanisme qui détecte les objets temporaires inutilisés et libère la mémoire. Moins d'objets temporaires = moins de pauses GC = programme plus fluide.", category: "Ruby", deck: "Rails" },
  { question: "Que fait l'opérateur &. (safe navigation) en Ruby ?", answer: "Il stoppe la chaîne et retourne nil au lieu de lever NoMethodError si l'objet est nil. Ex : user&.name retourne nil si user est nil.", category: "Ruby", deck: "Rails" },
  { question: "Quelle est la différence entre &. et try en Ruby/Rails ?", answer: "&. retourne nil si l'objet est nil mais lève NoMethodError si la méthode n'existe pas. try retourne nil dans les deux cas. Préférer &. car il détecte les typos.", category: "Ruby", deck: "Rails" },
  { question: "Quelle est la différence entre present?, nil? et blank? en Rails ?", answer: "nil? : true si nil. present? : true si non-nil ET non-vide. blank? : true si nil, chaîne vide (\"\") ou espaces (\"   \").", category: "Ruby", deck: "Rails" },
  { question: "Qu'est-ce qu'un Struct en Ruby ?", answer: "Un moyen rapide de créer une classe simple avec des attributs, sans écrire le boilerplate (initialize, attr_accessor). Ex : Point = Struct.new(:x, :y). Inclut ==, to_a, to_h.", category: "Ruby", deck: "Rails" },
  { question: "Quelle est la différence entre attr_reader, attr_writer et attr_accessor en Ruby ?", answer: "attr_reader : getter (lecture). attr_writer : setter (écriture). attr_accessor : les deux. Préférer attr_reader par défaut pour protéger les données.", category: "Ruby", deck: "Rails" },
  { question: "Que fait le mot-clé private dans une classe Ruby ?", answer: "Il empêche d'appeler les méthodes depuis l'extérieur de l'objet. À l'intérieur de la classe, toutes les méthodes (privées incluses) peuvent s'appeler.", category: "Ruby", deck: "Rails" },
  { question: "Comment fonctionne l'héritage en Ruby ?", answer: "Avec < : class Enfant < Parent. Ruby ne supporte que l'héritage simple. Pour l'héritage multiple, on utilise les modules (mixins) avec include ou extend.", category: "Ruby", deck: "Rails" },
  { question: "Quelle différence entre include et extend pour un module Ruby ?", answer: "include ajoute les méthodes du module comme méthodes d'instance. extend les ajoute comme méthodes de classe.", category: "Ruby", deck: "Rails" },
  { question: "Quelles sont les valeurs falsy en Ruby ?", answer: "Seuls false et nil sont falsy en Ruby. Tout le reste est truthy, y compris 0, '' (chaîne vide), et [] (tableau vide).", category: "Ruby", deck: "Rails" },
  { question: "Qu'est-ce que l'opérateur ||= en Ruby ?", answer: "L'opérateur de coalescence ||= assigne une valeur seulement si la variable est nil ou false. Ex : nom ||= 'Anonyme'.", category: "Ruby", deck: "Rails" },
  { question: "Quelle différence entre puts, print et p en Ruby ?", answer: "puts affiche avec retour à la ligne. print sans retour à la ligne. p affiche avec inspect (debug), montre les guillemets et caractères spéciaux.", category: "Ruby", deck: "Rails" },
  { question: "Qu'est-ce que le Duck Typing en Ruby ?", answer: "Ruby ne vérifie pas le type d'un objet mais s'il répond aux méthodes appelées. 'Si ça marche comme un canard, c'est un canard.' On vérifie avec respond_to?(:methode).", category: "Ruby", deck: "Rails" },
  { question: "Comment fonctionne Hash.new avec un bloc en Ruby ?", answer: "Hash.new { |h,k| h[k] = [] } crée un nouveau tableau par clé inexistante. Hash.new([]) partage le même objet entre toutes les clés (bug fréquent).", category: "Ruby", deck: "Rails" },
  { question: "À quoi sert la méthode dig sur un Hash en Ruby ?", answer: "dig permet un accès sûr en profondeur dans un Hash imbriqué. hash.dig(:adresse, :ville) retourne nil si le chemin est invalide, au lieu de NoMethodError.", category: "Ruby", deck: "Rails" },
  { question: "Qu'est-ce qu'un bloc en Ruby et ses deux syntaxes ?", answer: "Un morceau de code anonyme passé à une méthode. Syntaxe une ligne : { |param| code }. Multi-lignes : do |param| code end.", category: "Ruby", deck: "Rails" },
  { question: "Comment fonctionne yield en Ruby ?", answer: "yield exécute le bloc passé à une méthode. Il peut passer des arguments : yield(valeur). On vérifie si un bloc est donné avec block_given?.", category: "Ruby", deck: "Rails" },
  { question: "Quelle différence entre un Proc et un Lambda en Ruby ?", answer: "Lambda vérifie strictement le nombre d'arguments et return sort du lambda. Proc est flexible sur les arguments et return sort de la méthode englobante.", category: "Ruby", deck: "Rails" },
  { question: "Que fait le raccourci &:method en Ruby ?", answer: "Symbol#to_proc : ['alice', 'bob'].map(&:upcase) est équivalent à .map { |s| s.upcase }. Ne fonctionne que pour une méthode sans argument.", category: "Ruby", deck: "Rails" },
  { question: "Comment gérer les erreurs en Ruby avec begin/rescue ?", answer: "begin ... rescue TypeError => e ... else ... ensure ... end. rescue capture l'erreur, else s'exécute si aucune erreur, ensure s'exécute toujours. raise lève une erreur.", category: "Ruby", deck: "Rails" },
  { question: "Quelles sont les méthodes pour filtrer un Hash en Ruby ?", answer: "select : garde ce qui matche (→ Hash). reject : exclure ce qui matche. slice(:k1, :k2) : garder des clés connues. except(:k1) : exclure des clés connues.", category: "Ruby", deck: "Rails" },
  { question: "Que fait .compact sur un tableau Ruby ?", answer: "Il supprime tous les éléments nil du tableau. Ex : [1, nil, 3, nil].compact retourne [1, 3].", category: "Ruby", deck: "Rails" },
  { question: "Que fait respond_to? en Ruby ?", answer: "Il vérifie si un objet possède une méthode donnée. Retourne true/false. Ex : obj.respond_to?(:name) vérifie si obj a une méthode name.", category: "Ruby", deck: "Rails" },
  { question: "Que fait merge sur un Hash en Ruby ?", answer: "Combine deux hashes. En cas de clé dupliquée, la valeur du hash en argument l'emporte. Ex: {a: 1}.merge(a: 2) => {a: 2}. merge! modifie en place.", category: "Ruby", deck: "Rails" },

  # ──────────────────────────────────────────────────
  # DECK : Rails — Controllers / Params / MVC
  # ──────────────────────────────────────────────────
  { question: "Pourquoi ne faut-il jamais faire transiter par un hidden field une donnée disponible côté serveur ?", answer: "Un utilisateur peut modifier la valeur via DevTools. Il faut assigner côté serveur (ex: current_user.id) et utiliser merge.", category: "Rails", deck: "Rails" },
  { question: "Que font params.require(:user) et .permit(:name, :email) ?", answer: "require(:user) exige la clé :user (erreur 400 si absente). permit(:name, :email) n'autorise que ces clés, le reste est ignoré. C'est le mécanisme des strong params.", category: "Rails", deck: "Rails" },
  { question: "D'où viennent les params dans un controller Rails ?", answer: "3 sources fusionnées : le formulaire (POST/PATCH), l'URL dynamique (/users/:id), et la query string (?page=3). Les valeurs sont toujours des strings.", category: "Rails", deck: "Rails" },
  { question: "Quels sont les 3 composants du pattern MVC ?", answer: "Model : données + logique métier + BDD. View : affichage HTML. Controller : chef d'orchestre (reçoit la requête, appelle le model, choisit la vue).", category: "Rails", deck: "Rails" },
  { question: "Quelle est la différence entre les balises ERB <%= %> et <% %> ?", answer: "<%= %> exécute le code Ruby ET affiche le résultat dans le HTML. <% %> exécute le code sans rien afficher (conditions, boucles).", category: "Rails", deck: "Rails" },
  { question: "À quoi sert before_action dans un controller Rails ?", answer: "Exécute du code avant certaines actions. Ex: before_action :set_user, only: [:show, :edit, :update, :destroy] charge @user avant chaque action listée.", category: "Rails", deck: "Rails" },
  { question: "Qu'est-ce que le Use Case pattern en Rails ?", answer: "Une classe dédiée à une logique métier complexe (dans app/services/). Explicite (s'exécute quand on l'appelle) vs callback (implicite). À utiliser quand la logique implique plusieurs models.", category: "Rails", deck: "Rails" },
  { question: "Que fait render json: dans un controller Rails ?", answer: "Il convertit un hash Ruby en réponse JSON et le renvoie au client. Ex : render json: { token: \"abc\" } envoie {\"token\":\"abc\"} au JS.", category: "Rails", deck: "Rails" },
  { question: "Comment Rails reçoit-il les données JSON envoyées par le JS ?", answer: "Rails parse automatiquement le JSON et le met dans params. Ex : si le JS envoie { \"reason\": \"coach\" }, le controller accède à params[:reason].", category: "Rails", deck: "Rails" },

  # ──────────────────────────────────────────────────
  # DECK : Rails — Routes
  # ──────────────────────────────────────────────────
  { question: "Quelles sont les 7 actions RESTful d'un controller Rails ?", answer: "index (GET, lister), show (GET, afficher), new (GET, formulaire création), create (POST, créer), edit (GET, formulaire édition), update (PATCH, modifier), destroy (DELETE, supprimer).", category: "Routes", deck: "Rails" },
  { question: "Que génère 'resources :users' dans routes.rb ?", answer: "7 routes RESTful : index, show, new, create, edit, update, destroy. On peut limiter avec only: [:index, :show] ou except: [:destroy].", category: "Routes", deck: "Rails" },
  { question: "Quelle est la différence entre resources (pluriel) et resource (singulier) dans les routes ?", answer: "resources : collection avec :id dans l'URL, inclut index. resource : objet unique sans :id (/profile), pas d'index.", category: "Routes", deck: "Rails" },
  { question: "Quelle est la différence entre member et collection dans les routes Rails ?", answer: "member : action sur UN objet, URL avec :id (/articles/:id/publish). collection : action sur la COLLECTION, URL sans :id (/articles/search).", category: "Routes", deck: "Rails" },
  { question: "Qu'est-ce qu'un endpoint en développement web ?", answer: "Une URL précise + une méthode HTTP à laquelle un client envoie une requête. En Rails, chaque endpoint correspond à une action dans un controller.", category: "Routes", deck: "Rails" },
  { question: "Qu'est-ce qu'un namespace dans les routes Rails et que préfixe-t-il ?", answer: "Un namespace regroupe des controllers sous un préfixe commun. Il affecte : l'URL (/admin/...), le module Ruby (Admin::), le sous-dossier (admin/) et les vues.", category: "Routes", deck: "Rails" },
  { question: "Quelle est la différence entre namespace et scope dans les routes Rails ?", answer: "namespace préfixe tout (URL, module controller, sous-dossier). scope ne préfixe que l'URL, sans module ni sous-dossier.", category: "Routes", deck: "Rails" },
  { question: "Qu'est-ce qu'une route imbriquée (nested route) ?", answer: "Elle traduit une relation parent → enfant dans les routes. Ex : resources :articles do resources :comments end génère /articles/:article_id/comments.", category: "Routes", deck: "Rails" },
  { question: "Quelle est la règle de profondeur maximale pour les routes imbriquées ?", answer: "Maximum 2 niveaux. Au-delà, les URLs deviennent illisibles. Désimbriquer le 3e niveau en créant une route séparée.", category: "Routes", deck: "Rails" },
  { question: "Comment lister et filtrer les routes dans un projet Rails ?", answer: "rails routes pour tout lister. rails routes -c controleur pour filtrer. rails routes | grep mot pour chercher. rails routes --expanded pour le format détaillé.", category: "Routes", deck: "Rails" },
  { question: "Que faire quand un controller Rails a besoin d'une action hors des 7 CRUD ?", answer: "Créer un nouveau controller dédié avec des actions CRUD standard. Ex : « archiver » → Articles::ArchivesController avec create (archiver) et destroy (désarchiver).", category: "Rails", deck: "Rails" },

  # ──────────────────────────────────────────────────
  # DECK : Rails — ActiveRecord
  # ──────────────────────────────────────────────────
  { question: "Quelle est la différence entre find, find_by et where en ActiveRecord ?", answer: "find(id) : 1 objet ou erreur 404. find_by(clé: val) : 1 objet ou nil. where(clé: val) : collection (ActiveRecord::Relation) ou tableau vide.", category: "ActiveRecord", deck: "Rails" },
  { question: "Quelle est la différence entre destroy et delete en ActiveRecord ?", answer: "destroy : supprime en exécutant les callbacks (before_destroy, dependent: :destroy). delete : SQL direct, plus rapide mais sans callbacks.", category: "ActiveRecord", deck: "Rails" },
  { question: "Que signifie le pattern bang (!) en ActiveRecord (save!, create!, update!) ?", answer: "Sans ! : retourne false/nil en cas d'échec. Avec ! : lève une exception. Utiliser ! quand l'objet DOIT exister/être valide.", category: "ActiveRecord", deck: "Rails" },
  { question: "Quelle est la différence entre pluck et select en ActiveRecord ?", answer: "pluck(:attr) retourne un Array de valeurs simples (rapide). select(:attr) retourne des objets ActiveRecord avec seulement les colonnes demandées.", category: "ActiveRecord", deck: "Rails" },
  { question: "Qu'est-ce qu'un scope en Rails et comment le définir ?", answer: "Une requête réutilisable dans le model : scope :active, -> { where(active: true) }. S'appelle comme une méthode : User.active. Toujours chaînable.", category: "ActiveRecord", deck: "Rails" },
  { question: "Pourquoi faut-il éviter default_scope en Rails ?", answer: "Il s'applique automatiquement à TOUTES les requêtes (joins, create, tests), cause des bugs silencieux. Préférer des scopes nommés explicites.", category: "ActiveRecord", deck: "Rails" },
  { question: "Que fait .includes en ActiveRecord et quel problème résout-il ?", answer: ".includes pré-charge les associations en 2-3 requêtes SQL, résolvant le problème N+1 (1 requête par itération).", category: "ActiveRecord", deck: "Rails" },
  { question: "Quelle différence entre preload, eager_load et includes ?", answer: "preload : 2 requêtes séparées. eager_load : 1 requête avec LEFT OUTER JOIN. includes : choisit automatiquement entre les deux.", category: "ActiveRecord", deck: "Rails" },
  { question: "Que signifient belongs_to, has_many et has_one dans un modèle Rails ?", answer: "belongs_to : le modèle a la foreign key. has_many : relation 1-N (retourne une collection). has_one : relation 1-1 (retourne un objet unique).", category: "ActiveRecord", deck: "Rails" },
  { question: "À quoi sert class_name dans une association belongs_to ?", answer: "Il indique le vrai modèle quand le nom de l'association diffère. Ex : belongs_to :expert, class_name: :User — la colonne est expert_id mais pointe vers User.", category: "ActiveRecord", deck: "Rails" },
  { question: "Qu'est-ce qu'une transaction ActiveRecord ?", answer: "Bloc atomique : tout réussit ou tout est annulé (rollback). Utiliser save!/update! dedans pour déclencher le rollback automatique en cas d'échec.", category: "ActiveRecord", deck: "Rails" },
  { question: "Que fait raise ActiveRecord::Rollback dans une transaction ?", answer: "Exception spéciale rattrapée par Rails. Elle annule la transaction (rollback) SANS crasher l'application. Le code continue après le bloc transaction.", category: "ActiveRecord", deck: "Rails" },
  { question: "Quelle est la différence entre pluck et map en ActiveRecord ?", answer: "pluck exécute le SQL et retourne des valeurs brutes (Array), sans créer d'objets ActiveRecord → plus rapide. map charge les objets en mémoire.", category: "ActiveRecord", deck: "Rails" },
  { question: "Quelle est la règle d'or pour combiner ActiveRecord et Ruby ?", answer: "Faire le maximum côté SQL (where, order, count, pluck, group) car la BDD est optimisée, puis affiner côté Ruby (map, select, group_by).", category: "ActiveRecord", deck: "Rails" },
  { question: "Qu'est-ce qu'un enum dans un modèle Rails ?", answer: "Un enum mappe des valeurs symboliques (:draft, :published) à des entiers en base. Génère des scopes (Article.draft), des prédicats (article.draft?) et des setters (article.published!).", category: "ActiveRecord", deck: "Rails" },
  { question: "Quelle syntaxe pour un enum en Rails 7+ ?", answer: "enum :status, { draft: 0, published: 1, archived: 2 }. Toujours un hash explicite avec default: 0 et null: false dans la migration.", category: "ActiveRecord", deck: "Rails" },
  { question: "Quelles méthodes ActiveRecord déclenchent les validations ?", answer: "save, save!, create, create!, update, update!, valid?, invalid?. Les méthodes bang (!) lèvent ActiveRecord::RecordInvalid.", category: "ActiveRecord", deck: "Rails" },
  { question: "Quelles méthodes ActiveRecord ignorent les validations ?", answer: "update_column, update_columns, update_all, save(validate: false), update_attribute, increment!, decrement!, toggle!.", category: "ActiveRecord", deck: "Rails" },
  { question: "Quels sont les principaux helpers de validation ActiveRecord ?", answer: "presence, length, numericality, uniqueness, format, inclusion, exclusion, acceptance, confirmation, comparison (Rails 7+).", category: "ActiveRecord", deck: "Rails" },
  { question: "Pourquoi faut-il un index unique en base avec validates uniqueness ?", answer: "La validation uniqueness n'est pas infaillible (race condition entre deux requêtes simultanées). L'index unique en base est le filet de sécurité ultime.", category: "ActiveRecord", deck: "Rails" },
  { question: "Comment utiliser find_each pour traiter de gros volumes ?", answer: "User.find_each(batch_size: 1000) { |u| u.process } charge les enregistrements par lots au lieu de tout charger en mémoire.", category: "ActiveRecord", deck: "Rails" },
  { question: "Comment ActiveRecord gère WHERE avec des opérateurs (>, <, LIKE) ?", answer: "String SQL avec placeholder : where('price > ?', 100). Toujours utiliser ? pour éviter les injections SQL. Pour un Array : where(id: [1,2,3]) génère un IN.", category: "ActiveRecord", deck: "Rails" },

  # ──────────────────────────────────────────────────
  # DECK : Rails — Philosophie / Conventions
  # ──────────────────────────────────────────────────
  { question: "Que signifie 'Convention over Configuration' (CoC) en Rails ?", answer: "Rails impose des conventions de nommage (modèle Article → table articles → ArticlesController). Si on les suit, aucune configuration nécessaire.", category: "Rails", deck: "Rails" },
  { question: "Que signifie le principe DRY en Rails ?", answer: "Don't Repeat Yourself : chaque connaissance à un seul endroit. Ex : extraire params.permit dans une méthode privée, utiliser des partials, concerns, before_action.", category: "Rails", deck: "Rails" },
  { question: "Que signifie 'skinny controller, fat model' en Rails ?", answer: "Le controller doit rester maigre (recevoir, déléguer, répondre). La logique métier va dans le modèle. Le controller est un chef d'orchestre.", category: "Rails", deck: "Rails" },
  { question: "Qu'est-ce que le 'Majestic Monolith' défendu par Rails ?", answer: "Une seule application qui gère tout (front, back, API, jobs, mails) plutôt que des microservices. Un monolithe bien structuré suffit tant que l'équipe est petite.", category: "Rails", deck: "Rails" },

  # ──────────────────────────────────────────────────
  # DECK : Rails — Divers (PaperTrail, Rake, Stimulus, Emails)
  # ──────────────────────────────────────────────────
  { question: "Qu'est-ce que PaperTrail et à quoi sert-il ?", answer: "Gem Rails qui enregistre automatiquement l'historique des modifications d'un modèle (create, update, destroy). Crée des versions consultables et restaurables.", category: "Rails", deck: "Rails" },
  { question: "Comment activer PaperTrail et consulter les changements ?", answer: "Ajouter has_paper_trail dans le modèle. Consulter : article.versions, voir les changements : article.versions.last.changeset, restaurer : version.reify.save.", category: "Rails", deck: "Rails" },
  { question: "Qu'est-ce que Rake et comment créer une tâche ?", answer: "Rake (Ruby Make) exécute des tâches. Créer dans lib/tasks/nom.rake : namespace :nom do desc 'Desc' task ma_tache: :environment do ... end end.", category: "Rails", deck: "Rails" },
  { question: "À quoi sert rails console --sandbox ?", answer: "Lance la console en mode bac à sable : toutes les modifications en BDD sont automatiquement annulées (rollback) à la sortie.", category: "Rails", deck: "Rails" },
  { question: "Comment tester l'envoi d'emails en développement avec Mailcatcher ?", answer: "Lancer mailcatcher dans le terminal, ouvrir http://localhost:1080. Tous les mails envoyés en dev apparaissent dans cette interface.", category: "Rails", deck: "Rails" },
  { question: "Quels sont les 3 concepts fondamentaux de Stimulus ?", answer: "1) Controllers (data-controller) : lient HTML et JS\n2) Values (data-xxx-value) : passent des données du HTML au JS\n3) Targets (data-xxx-target) : référencent des éléments HTML depuis le JS", category: "Rails", deck: "Rails" },
  { question: "Quelle est la syntaxe d'une action Stimulus en HTML ?", answer: "événement->controller#méthode. Ex : data-action=\"click->phone-call#startCall\". Le controller est en kebab-case, la méthode en camelCase.", category: "Rails", deck: "Rails" },
  { question: "Quelle est la convention de nommage Stimulus entre HTML et fichier JS ?", answer: "kebab-case en HTML → snake_case + _controller.js pour le fichier. Ex : data-controller=\"phone-call\" → phone_call_controller.js.", category: "Rails", deck: "Rails" },
  { question: "Quelles sont les 5 étapes pour tracer un flux de code dans une app Rails ?", answer: "1) Identifier le point de départ (vue/bouton)\n2) Tracer la donnée dans la vue (ERB)\n3) Suivre le passage HTML → JS\n4) Identifier les appels JS → Backend\n5) Trouver où insérer la modification", category: "Général", deck: "Rails" },
  { question: "Quelles sont les 5 étapes d'une bonne code review ?", answer: "1. Comprendre le contexte\n2. Vérification fonctionnelle (cas limites)\n3. Qualité du code (lisibilité, DRY)\n4. Tests et sécurité\n5. Feedback constructif", category: "Général", deck: "Rails" },

  # ──────────────────────────────────────────────────
  # DECK : FastAPI & Python
  # ──────────────────────────────────────────────────
  { question: "Qu'est-ce que FastAPI et quels sont ses avantages ?", answer: "Framework web Python pour créer des API. Performances proches de Go/Node, documentation auto (Swagger/ReDoc), validation automatique avec Pydantic, support async natif.", category: "FastAPI", deck: "FastAPI & Python" },
  { question: "Comment fonctionne l'injection de dépendances dans FastAPI ?", answer: "Avec Depends(). Ex: def get_items(db = Depends(get_db)). FastAPI appelle get_db() et injecte le résultat. Utile pour sessions DB, auth, paramètres communs.", category: "FastAPI", deck: "FastAPI & Python" },
  { question: "Comment gérer les erreurs HTTP dans FastAPI ?", answer: "Avec raise HTTPException(status_code=404, detail=\"Not found\"). On peut aussi créer des gestionnaires personnalisés avec @app.exception_handler().", category: "FastAPI", deck: "FastAPI & Python" },
  { question: "Comment organiser les routes dans FastAPI avec les routers ?", answer: "Créer un APIRouter(prefix=\"/users\", tags=[\"users\"]), définir les routes avec @router.get(), puis inclure dans main avec app.include_router(router).", category: "FastAPI", deck: "FastAPI & Python" },
  { question: "Quel est l'avantage de SQLModel par rapport à SQLAlchemy + Pydantic ?", answer: "SQLModel combine les deux en un seul modèle : class User(SQLModel, table=True) sert à la fois pour la BDD (ORM) et la validation API (Pydantic). Moins de code dupliqué.", category: "Python", deck: "FastAPI & Python" },
  { question: "Comment structurer les modèles SQLModel (pattern Base/Create/Read/Update) ?", answer: "UserBase (champs communs), User(UserBase, table=True) pour la DB, UserCreate(UserBase) sans id, UserUpdate(SQLModel) tout optionnel, UserRead(UserBase) avec id.", category: "Python", deck: "FastAPI & Python" },
  { question: "Comment définir une relation One-to-Many avec SQLModel ?", answer: "Côté Many : team_id: int = Field(foreign_key=\"team.id\") + Relationship(back_populates=\"members\"). Côté One : members: list[Member] = Relationship(back_populates=\"team\").", category: "Python", deck: "FastAPI & Python" },
  { question: "Comment définir une relation Many-to-Many avec SQLModel ?", answer: "Créer une table de liaison avec 2 clés étrangères comme clé primaire composite, puis Relationship(back_populates=..., link_model=LinkTable) des deux côtés.", category: "Python", deck: "FastAPI & Python" },
  { question: "Qu'est-ce que Pydantic et quel est son rôle ?", answer: "Bibliothèque Python de validation de données par annotations de type. Valide et convertit automatiquement les types, fournit des messages d'erreur clairs. Utilisée par FastAPI.", category: "Python", deck: "FastAPI & Python" },
  { question: "Comment fonctionne Field() dans Pydantic/SQLModel pour la validation ?", answer: "Définit des contraintes : Field(min_length=3, max_length=50) pour strings, Field(ge=0, le=100) pour nombres (ge = greater or equal, le = less or equal).", category: "Python", deck: "FastAPI & Python" },
  { question: "Quelles sont les principales structures de données en Python ?", answer: "list = ordonnée, mutable. tuple = ordonné, immuable. set = non ordonné, éléments uniques. dict = paires clé-valeur.", category: "Python", deck: "FastAPI & Python" },
  { question: "Qu'est-ce qu'une list comprehension en Python ?", answer: "Syntaxe concise pour créer des listes : [x**2 for x in range(10) if x % 2 == 0]. Équivalent à une boucle for + append, mais plus lisible.", category: "Python", deck: "FastAPI & Python" },
  { question: "Qu'est-ce qu'un décorateur en Python ?", answer: "Fonction qui prend une fonction en argument et retourne une nouvelle fonction enrichie. Syntaxe : @mon_decorateur au-dessus de la fonction. Ex: @app.get(\"/\") dans FastAPI.", category: "Python", deck: "FastAPI & Python" },
  { question: "À quoi sert le fichier __init__.py en Python ?", answer: "Il transforme un dossier en package Python importable. Peut être vide ou contenir des réexportations. Ex: from mon_package import MaClasse.", category: "Python", deck: "FastAPI & Python" },
  { question: "Quelles sont les commandes Alembic essentielles pour les migrations ?", answer: "alembic revision --autogenerate -m \"message\" pour générer, alembic upgrade head pour appliquer, alembic downgrade -1 pour annuler.", category: "Python", deck: "FastAPI & Python" },
  { question: "Qu'est-ce que le CORS et pourquoi est-il nécessaire ?", answer: "Sécurité navigateur qui bloque les requêtes entre origines différentes. Nécessaire quand React (port 5173) appelle FastAPI (port 8000). Configurer avec CORSMiddleware.", category: "FastAPI", deck: "FastAPI & Python" },

  # ──────────────────────────────────────────────────
  # DECK : JavaScript & React
  # ──────────────────────────────────────────────────
  { question: "Comment les attributs data-* HTML sont-ils convertis en JavaScript via dataset ?", answer: "Kebab-case → camelCase. Ex : data-expert-phone → dataset.expertPhone. Les valeurs sont toujours des strings.", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Que fait le mot-clé static en JavaScript ?", answer: "Déclare une propriété ou méthode qui appartient à la classe, pas aux instances. On y accède via Classe.propriete. En Stimulus, déclare values et targets.", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Quelle différence entre let, const et var en JavaScript ?", answer: "const = constante (block-scoped). let = variable modifiable (block-scoped). var = ancienne syntaxe (function-scoped, à éviter). Préférer const par défaut.", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Quelle différence entre === et == en JavaScript ?", answer: "=== (stricte) compare type ET valeur. == (faible) fait coercion de type. Ex: 5 === \"5\" est false, 5 == \"5\" est true. Toujours utiliser ===.", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Que font les opérateurs ?. et ?? en JavaScript ?", answer: "?. (optional chaining) évite les erreurs sur null/undefined. ?? (nullish coalescing) fournit une valeur par défaut pour null/undefined uniquement.", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Comment fonctionne le destructuring en JavaScript ?", answer: "Extraction : const { name, age } = user (objets), const [first, ...rest] = arr (tableaux). Permet renommage ({ name: userName }) et valeurs par défaut.", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Quelle différence entre map, filter et reduce en JavaScript ?", answer: "map transforme chaque élément (→ nouveau tableau). filter garde selon condition. reduce accumule en une seule valeur.", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Quels sont les 3 états d'une Promise en JavaScript ?", answer: "pending (en attente), fulfilled (résolue), rejected (échouée). On consomme avec .then()/.catch() ou async/await + try/catch.", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Que fait async/await en JavaScript ?", answer: "async déclare une fonction asynchrone (retourne toujours une Promise). await attend la résolution. await ne peut être utilisé que dans une fonction async.", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Pourquoi fetch ne rejette-t-il pas sur une erreur HTTP 404 ou 500 ?", answer: "fetch ne considère comme erreur que les problèmes réseau. Un 404/500 est une 'réussite'. Il faut vérifier if (!response.ok) manuellement.", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Quelle est la valeur de this dans une arrow function JavaScript ?", answer: "Les arrow functions n'ont pas leur propre this : elles héritent du contexte englobant (lexical this). Ne jamais les utiliser comme méthodes d'objet.", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Que font call(), apply() et bind() en JavaScript ?", answer: "call(this, arg1, arg2) : appel immédiat avec args séparés. apply(this, [args]) : appel immédiat avec tableau. bind(this) : retourne nouvelle fonction avec this fixé.", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Comment déclarer des propriétés privées en JavaScript (ES2022) ?", answer: "Avec le préfixe # : #solde = 0 et #methodePrivee(). Inaccessibles depuis l'extérieur de la classe (SyntaxError).", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Qu'est-ce que le Virtual DOM dans React ?", answer: "Copie en mémoire du DOM réel. Quand l'état change, React compare l'ancien et le nouveau (diffing), puis applique uniquement les modifications nécessaires.", category: "React", deck: "JavaScript & React" },
  { question: "Quelles sont les règles du JSX dans React ?", answer: "Un seul élément racine (ou Fragment <>), className au lieu de class, htmlFor au lieu de for, attributs en camelCase, expressions JS entre {}.", category: "React", deck: "JavaScript & React" },
  { question: "Comment fonctionne useState dans React ?", answer: "const [value, setValue] = useState(initial). Pour les objets : setValue({...prev, key: newVal}). Forme fonctionnelle : setValue(prev => ...) pour mises à jour basées sur l'état précédent.", category: "React", deck: "JavaScript & React" },
  { question: "Comment fonctionne le tableau de dépendances de useEffect ?", answer: "Sans tableau : exécuté à chaque rendu. [] : une fois au montage. [dep1, dep2] : quand une dépendance change. La fonction de retour est le cleanup.", category: "React", deck: "JavaScript & React" },
  { question: "Quelle différence entre useMemo et useCallback ?", answer: "useMemo mémorise le résultat d'un calcul. useCallback mémorise une référence de fonction. Utile avec React.memo pour éviter les re-rendus inutiles.", category: "React", deck: "JavaScript & React" },
  { question: "Comment fonctionne useContext dans React ?", answer: "1. createContext() crée le contexte\n2. Provider fournit la valeur dans l'arbre\n3. useContext(MyContext) consomme la valeur. Évite le prop drilling.", category: "React", deck: "JavaScript & React" },
  { question: "Quelles sont les 2 règles des Hooks React ?", answer: "1. Appeler les Hooks uniquement au niveau racine (jamais dans boucles, conditions ou fonctions imbriquées).\n2. Appeler uniquement dans des composants React ou hooks personnalisés.", category: "React", deck: "JavaScript & React" },
  { question: "Comment créer un hook personnalisé en React ?", answer: "Créer une fonction commençant par 'use' qui utilise d'autres hooks. Ex: function useFetch(url) { ... return { data, loading, error }; }", category: "React", deck: "JavaScript & React" },
  { question: "Qu'est-ce que Vite et pourquoi est-il rapide ?", answer: "Outil de build moderne. En dev, utilise les ES Modules natifs (pas de bundling). Démarrage instantané, HMR ultra-rapide. En production, Rollup pour un bundle optimisé.", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Quelle est la philosophie de Testing Library ?", answer: "Tester le comportement (comme un utilisateur), pas l'implémentation. Priorité : getByRole > getByLabelText > getByText > getByTestId.", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Quelle différence entre getBy, queryBy et findBy dans Testing Library ?", answer: "getBy : erreur si absent. queryBy : retourne null si absent (vérifier l'absence). findBy : attend de manière async l'apparition.", category: "JavaScript", deck: "JavaScript & React" },
  { question: "Comment fonctionne useReducer dans React ?", answer: "Alternative à useState pour états complexes. Prend un reducer (state, action) => newState et un état initial. Retourne [state, dispatch].", category: "React", deck: "JavaScript & React" },
  { question: "Qu'est-ce que useRef dans React ?", answer: "Référence mutable qui persiste entre les rendus sans déclencher de re-render. 2 usages : accéder au DOM (inputRef.current.focus()) et stocker des valeurs mutables.", category: "React", deck: "JavaScript & React" },
  { question: "Qu'est-ce que le lazy loading dans React ?", answer: "const Page = lazy(() => import('./Page')) charge le composant uniquement quand nécessaire. Envelopper dans <Suspense fallback={<Loading/>}>.", category: "React", deck: "JavaScript & React" },
  { question: "Comment lancer Promise.all et pourquoi ?", answer: "const [a, b] = await Promise.all([fetchA(), fetchB()]). Lance plusieurs Promises en parallèle. Plus rapide que les await séquentiels.", category: "JavaScript", deck: "JavaScript & React" },

  # ──────────────────────────────────────────────────
  # DECK : Général
  # ──────────────────────────────────────────────────
  { question: "Quelles sont les 3 zones de Git ?", answer: "1. Working Directory (fichiers en cours)\n2. Staging Area (fichiers prêts à commiter, via git add)\n3. Repository (historique des commits)", category: "Général", deck: "Général" },
  { question: "Quels sont les types de commits conventionnels en Git ?", answer: "feat (nouvelle fonctionnalité), fix (correction), docs (documentation), style (formatage), refactor, test (tests), chore (maintenance).", category: "Général", deck: "Général" },
  { question: "Quelle différence entre git merge et git rebase ?", answer: "merge crée un commit de fusion (historique non linéaire mais complet). rebase réécrit l'historique (linéaire mais à ne jamais faire sur des branches partagées).", category: "Général", deck: "Général" },
  { question: "Quelle différence entre les méthodes HTTP GET, POST, PUT, PATCH et DELETE ?", answer: "GET = lire. POST = créer (non idempotent). PUT = remplacer entièrement (idempotent). PATCH = modifier partiellement. DELETE = supprimer.", category: "Général", deck: "Général" },
  { question: "Quelle différence entre PUT et PATCH en HTTP ?", answer: "PUT remplace entièrement la ressource (champs non fournis perdus). PATCH modifie partiellement (seuls les champs fournis sont mis à jour).", category: "Général", deck: "Général" },
  { question: "Quelles sont les balises sémantiques HTML5 principales ?", answer: "<header>, <nav>, <main> (unique), <article> (contenu autonome), <section> (regroupement), <aside> (contenu annexe), <footer>.", category: "Général", deck: "Général" },
  { question: "Qu'est-ce que le Box Model en CSS ?", answer: "Chaque élément = content + padding (intérieur) + border + margin (extérieur). Astuce : box-sizing: border-box fait que width inclut padding et border.", category: "Général", deck: "Général" },
  { question: "Quelle différence entre Flexbox et Grid en CSS ?", answer: "Flexbox = mise en page 1D (ligne OU colonne). Grid = mise en page 2D (lignes ET colonnes). Flexbox pour aligner, Grid pour layouts complexes.", category: "Général", deck: "Général" },
  { question: "Comment fonctionne la spécificité CSS (cascade) ?", answer: "inline style (1000) > #id (100) > .classe (10) > élément (1). La règle la plus spécifique gagne. !important écrase tout (à éviter).", category: "Général", deck: "Général" },
  { question: "Comment fonctionne la grille Bootstrap (12 colonnes) ?", answer: "row + col-{breakpoint}-{taille}. Ex: col-md-6 col-lg-4 = moitié sur tablette, tiers sur desktop. Breakpoints : sm(576), md(768), lg(992), xl(1200).", category: "Général", deck: "Général" },
  { question: "Comment fonctionne la syntaxe d'espacement Bootstrap ?", answer: "{propriété}{côté}-{taille}. Propriété: m (margin) ou p (padding). Côté: t/b/s/e/x/y. Taille: 0 à 5. Ex: mt-3, px-2, mx-auto.", category: "Général", deck: "Général" },
  { question: "Quelle est la philosophie 'utility-first' de Tailwind CSS ?", answer: "Composer le style avec des micro-classes dans le HTML : class=\"bg-white rounded-lg shadow-md p-6\". Mobile-first avec préfixes sm:, md:, lg:.", category: "Général", deck: "Général" },
  { question: "Quelles sont les 4 fonctionnalités principales que SCSS ajoute au CSS ?", answer: "Variables ($var), imbrication (nesting), mixins (@mixin/@include), et héritage (@extend). Plus les boucles, conditions et fonctions.", category: "Général", deck: "Général" },
  { question: "En SCSS, à quoi sert le sélecteur parent & ?", answer: "& référence le sélecteur parent. Utile pour les pseudo-classes (&:hover), les modificateurs BEM (&--primary) et les éléments BEM (&__icon).", category: "Général", deck: "Général" },
  { question: "En SCSS, quelle est la différence entre un mixin et un @extend ?", answer: "Un @mixin est un bloc réutilisable avec paramètres (appelé via @include). @extend hérite des styles d'un autre sélecteur. Le mixin duplique le code, @extend le regroupe.", category: "Général", deck: "Général" },
  { question: "Qu'est-ce qu'un ORM et quel est son rôle ?", answer: "Object-Relational Mapping : traduit du code objet en SQL. Simplifie l'interaction BDD, protège contre les injections SQL. Ex: ActiveRecord (Ruby), SQLModel (Python).", category: "Général", deck: "Général" },
  { question: "Quelles sont les commandes psql essentielles ?", answer: "\\l = lister les bases, \\c nom = se connecter, \\dt = lister les tables, \\d table = structure, \\x = affichage vertical, \\q = quitter.", category: "Général", deck: "Général" },
  { question: "Quelle est la différence entre la médiane et la moyenne ?", answer: "La médiane est la valeur centrale (50% au-dessus, 50% en-dessous). La moyenne = somme/nombre. La médiane élimine l'impact des valeurs extrêmes.", category: "Général", deck: "Général" }
]

cards.each do |card_data|
  deck = DECK_MAP[card_data[:deck]]
  Card.find_or_create_by!(
    question: card_data[:question],
    deck: deck
  ) do |card|
    card.answer = card_data[:answer]
    card.category = card_data[:category]
  end
end

puts "✅ #{cards.size} flashcards créées dans #{DECK_MAP.keys.size} decks."
