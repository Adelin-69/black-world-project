<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>BLΛCK-WORLD</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="<?php echo DOMAIN; ?>css/materialize.min.css"  media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="<?php echo DOMAIN; ?>css/style.css"/>
    <?php if (Functions::IsLoggedIn() && ((isset($page[0]) && $page[0] === 'company_select') || (isset($page[0]) && $page[0] === 'clan' && isset($page[1]) && $page[1] === 'company'))) { ?>
    <link type="text/css" rel="stylesheet" href="<?php echo DOMAIN; ?>css/company-select.css"/>
    <?php } ?>
    <?php if (Functions::IsLoggedIn() && (isset($page[0]) && $page[0] === 'skill_tree')) { ?>
    <link type="text/css" rel="stylesheet" href="<?php echo DOMAIN; ?>css/skill-tree.css"/>
    <?php } ?>
    <?php if (Functions::IsLoggedIn() && (isset($page[0]) && $page[0] === 'ships')) { ?>
    <link type="text/css" rel="stylesheet" href="<?php echo DOMAIN; ?>css/ships.css"/>
    <?php } ?>
  </head>
  <style>
    div.nav-wrapper {
   background-color: #00141a; 
   box-shadow: inset 0px 0px 25px 1px #004e66;
  }
 .start {
   box-shadow: inset 0px 0px 25px 1px black;
   background-color: #007A00;
   border: 1.5px solid black;
   border-radius: 25px 0px 25px 0px;
   text-align: center;
   animation: mymove 1s infinite;
  }
  @keyframes mymove {
  50% {border-color: green;}
    </style>
  <body>
    <div id="app">

      <?php if (Functions::IsLoggedIn()) { ?>
      <ul id="dropdown1" class="dropdown-content">
        <li><a href="<?php echo DOMAIN; ?>ships">Ships</a></li>
        <li><a href="<?php echo DOMAIN; ?>equipment">Equipment</a></li>
        <li><a href="<?php echo DOMAIN; ?>skill-tree">Skill Tree</a></li>
      </ul>
      <ul id="dropdown2" class="dropdown-content">

        <?php if ($player['clanId'] <= 0) { ?>
        <li><a href="<?php echo DOMAIN; ?>clan/join">Join</a></li>
        <li><a href="<?php echo DOMAIN; ?>clan/found">Found</a></li>

        <?php } else { ?>
        <li><a href="<?php echo DOMAIN; ?>clan/informations">Informations</a></li>
        <li><a href="<?php echo DOMAIN; ?>clan/members">Members</a></li>
        <li><a href="<?php echo DOMAIN; ?>clan/diplomacy">Diplomacy</a></li>
        <?php }?>

        <li><a href="<?php echo DOMAIN; ?>clan/company">Company</a></li>
      </ul>
      <nav>
        <div class="nav-wrapper">
          <a href="<?php echo DOMAIN; ?>" class="brand-logo" style="margin-left: 15px">BLΛCK-WORLD</a>
          <div class="container">
          <ul class="right hide-on-med-and-down">
            <li><a href="<?php echo DOMAIN; ?>shop">Shop</a></li>
            <li><a href="<?php echo DOMAIN; ?>ships">Ships</a></li>
            <li><a href="<?php echo DOMAIN; ?>equipment">Equipment</a></li>
            <li class="start"><a href="<?php echo DOMAIN; ?>map-revolution" target="_blank" style="font-size: 20px; width: 150px;">Play!</a></li>
            <li><a href="<?php echo DOMAIN; ?>skill-tree">Skill Tree</a></li>
            <li><a class="dropdown-trigger" href="#!" data-target="dropdown2">Clan<i class="material-icons right">arrow_drop_down</i></a></li>
            <li><a href="<?php echo DOMAIN; ?>donation"></a></li>
            <li><a href="<?php echo DOMAIN; ?>settings">Settings</a></li>
            <li><a class="brand-logo right" style="font-size: 25px; color: red" href="/api/logout">Logout</a></li>
          </ul>
          </div>
        </div>
      </nav>
      <?php } ?>
