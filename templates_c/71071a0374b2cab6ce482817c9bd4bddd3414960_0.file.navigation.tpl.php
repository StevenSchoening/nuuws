<?php
/* Smarty version 3.1.30, created on 2017-03-29 10:43:00
  from "C:\xampp\htdocs\nuuws\portal\frontend\templates\nav\navigation.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_58db7394405029_03866141',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '71071a0374b2cab6ce482817c9bd4bddd3414960' => 
    array (
      0 => 'C:\\xampp\\htdocs\\nuuws\\portal\\frontend\\templates\\nav\\navigation.tpl',
      1 => 1490776979,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_58db7394405029_03866141 (Smarty_Internal_Template $_smarty_tpl) {
?>
<nav>
    <ul class="navigation_list">
        <a href="/nuuws"><li>Startseite</li></a>
        <a href="/nuuws/nachrichten"><li>Nachrichten</li></a>
        <?php if ($_smarty_tpl->tpl_vars['isAdmin']->value) {?>
            <a href="/nuuws/artikel-einreichen.html"><li>Artikel verwalten</li></a>
        <?php }?>
        <?php if (!$_smarty_tpl->tpl_vars['isLogedIn']->value) {?>
            <a href="/nuuws/login"><li>Einloggen</li></a>
        <?php }?>
    </ul>
</nav><?php }
}
