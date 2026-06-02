# Tailwind CSS — règles pour ce dossier

## Lisibilité et ordre des classes

Respecter l'ordre logique : layout → flexbox/grid → espacement → taille → couleur → typographie → effets. Préférer une classe par "intention" plutôt qu'un empilement difficile à lire.

## Extraire les patterns répétés

Si un même ensemble de classes apparaît plus de deux fois, l'extraire dans un partial ERB plutôt que de le dupliquer. Ne pas créer de classes CSS custom juste pour regrouper des utilitaires Tailwind.

## Mobile first

Toujours écrire le style de base sans préfixe (mobile), puis surcharger avec `sm:`, `md:`, `lg:` pour les écrans plus larges. Ne pas partir du desktop pour redescendre.

## Ne pas mélanger Tailwind et CSS custom sans raison

Éviter de combiner des classes Tailwind et des règles CSS dans `app/assets/` sur le même élément sauf besoin explicite (animation custom, pseudo-élément complexe). Si du CSS custom est nécessaire, documenter pourquoi Tailwind ne suffisait pas.
