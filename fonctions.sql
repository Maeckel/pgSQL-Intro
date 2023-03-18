Create or Replace Function calculer_longueur_max(chaine1 varchar(100) , chaine2 varchar(100) ) Returns integer as $$
	DECLARE
		resultat integer;
	BEGIN
		CASE
		 WHEN length(chaine1) > length(chaine2) THEN
			resultat = length(chaine1);
			RAISE INFO 'Chaine 1 plus longue :';
		 WHEN length(chaine1) < length(chaine2) THEN
			resultat = length(chaine2);
			RAISE INFO 'Chaine 2 plus longue :';
		 WHEN length(chaine1) = length(chaine2) THEN
			resultat = length(chaine1);
			RAISE INFO 'Chaine 1 et Chaine 2 egal :';
		END CASE;
		return resultat;
	END ;
$$ LANGUAGE plpgsql ; 

Create or Replace Function getNbJoursParMois( dateEntree date ) Returns integer as $$
	DECLARE
		resultat integer;
	BEGIN
		resultat = date_part( 'days' , (date_trunc('month' , dateEntree) + interval '1 month - 1 day') );
		RAISE INFO 'Nombre de jour dans mois :';
	return resultat;
	END ;
$$ LANGUAGE plpgsql ; 

Create or Replace Function dateSqltoDateFR( dateEntree date ) Returns varchar(10)  as $$
	DECLARE
		resultat varchar(10);
		Jour varchar(10);
		Mois varchar(10);
		Annee varchar(10);
	BEGIN
		Jour = lpad(DATE_PART('Day', dateEntree)::text, 2, '0');
		Mois = lpad(DATE_PART('Month', dateEntree)::text, 2, '0');
		Annee = DATE_PART('Year', dateEntree);
		resultat = Jour || '/' || Mois || '/' || Annee ;
		return resultat;
	END ;
$$ LANGUAGE plpgsql ; 

Create or Replace Function getNomJour( dateEntree date ) Returns varchar(10) as $$
	DECLARE
		resultat varchar(10);
	BEGIN
		resultat = to_char(dateEntree, 'Day') ;
		return resultat;
	END ;
$$ LANGUAGE plpgsql ;

Create or Replace Function nb_occurrences_1( caractere varchar(1) , chaine varchar(100) , indiceDebut integer , indiceFin integer ) Returns varchar(100) as $$
	DECLARE
		resultat integer;
		i varchar(1);
		erreur varchar(100);
		occurrences varchar(100);
		x integer;
	BEGIN
		resultat = 0;
		x = indiceDebut;
		WHILE x != indiceFin + 1 LOOP
			i = substr(chaine, x , 1);
			x = x + 1;
			IF caractere = i THEN
				resultat = resultat + 1;
			END IF;
		END LOOP;
		CASE
			WHEN indiceDebut < 1 or indiceDebut > length(chaine) THEN
				erreur = 'INTERVALLE NON RESPECTÉ POUR INDICE DE DEPART';
				return erreur;
			WHEN indiceFin < 1 or indiceFin > length(chaine) THEN
				erreur = 'INTERVALLE NON RESPECTÉ POUR INDICE DE FIN';
				return erreur;
			ELSE
			RAISE INFO 'Nombre d occurrence trouvé dans la chaine :' ;
			occurrences = '' || resultat || '';
			return occurrences;
		END CASE;
	END ;
$$ LANGUAGE plpgsql ;

Create or Replace Function nb_occurrences_2( caractere varchar(1) , chaine varchar(100) , indiceDebut integer , indiceFin integer ) Returns varchar(100) as $$
	DECLARE
		resultat integer;
		i varchar(1);
		erreur varchar(100);
		occurrences varchar(100);
		x integer;
	BEGIN
		resultat = 0;
		x = indiceDebut;
		LOOP	
		i = substr(chaine, x , 1);
		x = x + 1;
		IF caractere = i THEN
			resultat = resultat + 1;
		END IF;
		IF x = indiceFin + 1 THEN
			EXIT;
		END IF;
		END LOOP;
		CASE
			WHEN indiceDebut < 1 or indiceDebut > length(chaine) THEN
				erreur = 'INTERVALLE NON RESPECTÉ POUR INDICE DE DEPART';
				return erreur;
			WHEN indiceFin < 1 or indiceFin > length(chaine) THEN
				erreur = 'INTERVALLE NON RESPECTÉ POUR INDICE DE FIN';
				return erreur;
			ELSE
			RAISE INFO 'Nombre d occurrence trouvé dans la chaine :' ;
			occurrences = '' || resultat || '';
			return occurrences;
		END CASE;
	END ;
$$ LANGUAGE plpgsql ;

Create or Replace Function nb_occurrences_3( caractere varchar(1) , chaine varchar(100) , indiceDebut integer , indiceFin integer ) Returns varchar(100) as $$
	DECLARE
		resultat integer;
		i varchar(1);
		erreur varchar(100);
		occurrences varchar(100);
		x integer;
	BEGIN
		resultat = 0;
		FOR x in indiceDebut..indiceFin LOOP
			i = substr(chaine, x , 1);
			IF caractere = i THEN
				resultat = resultat + 1;
			END IF;
		END LOOP;
		CASE
			WHEN indiceDebut < 1 or indiceDebut > length(chaine) THEN
				erreur = 'INTERVALLE NON RESPECTÉ POUR INDICE DE DEPART';
				return erreur;
			WHEN indiceFin < 1 or indiceFin > length(chaine) THEN
				erreur = 'INTERVALLE NON RESPECTÉ POUR INDICE DE FIN';
				return erreur;
			ELSE
			RAISE INFO 'Nombre d occurrence trouvé dans la chaine :' ;
			occurrences = '' || resultat || '';
			return occurrences;
		END CASE;
	END ;
$$ LANGUAGE plpgsql ;
		


		
		
