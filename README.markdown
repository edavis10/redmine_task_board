# Redmine Task Board

## Introduction

This plugin adds a 'Task Board' tab to your Project Menu for any Project with the 'Task Boards' module enabled (Settings>Modules). This tab will show the Task Board for the current Sprint (cough Version cough). 

The task board is a visual representation of the Issues in the Sprint grouped by Issue Status. This plugin allows you to drag-n-drop Issues from one Status to another as you progress through the Sprint. If you change the Status for an Issue without an Owner, the Issue will be assigned to you (this makes for easy 'claiming' of Issues during a Daily Stand-up).

## Coming Soon

By itself, the task board lists all Issues in a single row. This can quickly become overwhelming for large numbers of Issues (or for where Issues naturally lump together hierarchically). Because of this, when the task board plugin is installed with the (forthcoming) story decomposition plugin, Tasks (child Issues) are grouped into a row by their Story (parent Issue).

## Installation

Choose your poison:

 * git submodule add git://github.com/scrumalliance/redmine_task_board.git  vendor/plugins/redmine_task_board
 * ./script/plugin install git://github.com/scrumalliance/redmine_task_board.git

-----

Copyright (c) 2009 [Scrum Alliance](www.scrumalliance.org), released under the MIT license. 

Authored by:

* [Dan Hodos](mailto:danhodos[at]gmail[dot]com)
* [Doug Alcorn](mailto:dougalcorn[at]gmail[dot]com)
