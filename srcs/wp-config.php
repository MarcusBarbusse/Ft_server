<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier contient les réglages de configuration suivants : réglages MySQL,
 * préfixe de table, clés secrètes, langue utilisée, et ABSPATH.
 * Vous pouvez en savoir plus à leur sujet en allant sur
 * {@link http://codex.wordpress.org/fr:Modifier_wp-config.php Modifier
 * wp-config.php}. C’est votre hébergeur qui doit vous donner vos
 * codes MySQL.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en "wp-config.php" et remplir les
 * valeurs.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wordpress' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'admin' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'admin' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'localhost' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** Type de collation de la base de données.
 * N’y touchez que si vous savez ce que vous faites.
 */
define('DB_COLLATE', '');

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clefs secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'J9PU3fZLo!(tr6-+02E) -(c5U22g4,PL^nPJH{-7GA?1UQ?*~YTgu!J.=N9Bs0W');
define('SECURE_AUTH_KEY',  '|>T,GREIQy`D@-e(.k0]+cBR)}(I-=wqdiK!<x!bZ8K43H%~i-+-i>U3>lMwG2rd');
define('LOGGED_IN_KEY',    '_B{+d`dOoqj+7`6LBm7xi7-JhkqKEj&Mk4imK@[5xUY-{B6kvf|+_;|m;s0i}Q.`');
define('NONCE_KEY',        'z{K0/rN=PYkz9{e9(1 !>X[.j~ci{[qGSGl!?_.}NQw|%MD+>{z&roFz8=P-o0-v');
define('AUTH_SALT',        'f8Y,$7ES)W`>KjH_CGB-h2ef7^~|mCZ@-dMI&AXe iaN#X+7i6YL|1i8|X FyArU');
define('SECURE_AUTH_SALT', '%cA7Q}G#Q9M_|EdCvJ)Gm&{U;]|}!ztNp)D>8&X[m$UD2Uso9<cl`>eD:uY9AK_T');
define('LOGGED_IN_SALT',   '@nF9{hH?Sz*;+v(}<t[F`+}UvGD9u@(Y&T tiaSl-&sa, O:tn<U#(R>XGy.+_b5');
define('NONCE_SALT',       '%uW{ET<|vzD-~t8mx.RCi.P3zt<LB9!?76T]&,D;|eNW|k<`/x+buQ XDqG&JO-}');
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortemment recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once(ABSPATH . 'wp-settings.php');