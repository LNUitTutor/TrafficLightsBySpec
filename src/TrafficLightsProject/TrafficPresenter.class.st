"
I present the GUI of a TrafficLights. The GUI is build using Spec.

To open me execute

```language=Pharo
TrafficPresenter new open.
```

###Instance Variables
	model:		<a TrafficLights>
	view:		<a SpMorphPresenter> presents the body
	body:		<a BorderedMorph> with three submorphs of the BaloonMorph class
	manualButton:		<a Button> switches lamps one by one in the manual mode, stops automatic switching
	autoButton:		<a Button> stops automatic switching, opens the input dialog to define durations of glow
	durationPanel:		<an InputPanelPresenter> it's button starts switching in the automatic mode
	quitButton:		<a Button> press to exit
###Implementation
A TrafficPresenter creates all subpresenters and morphs, creates a TrafficLights instance with the body morph.
"
Class {
	#name : #TrafficPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'view',
		'manualButton',
		'autoButton',
		'durationPanel',
		'switchButton',
		'quitButton',
		'model'
	],
	#category : #'TrafficLightsProject-View'
}

{ #category : #initialization }
TrafficPresenter >> connectPresenters [

	manualButton action: [
		model
			stop;
			changeLamp ].
	autoButton action: [
		model stop.
		durationPanel show ].
	durationPanel action: [
		durationPanel hide.
		model
			setDurations: durationPanel allDurations;
			run ].
	switchButton
		whenActivatedDo: [
			switchButton
				label: 'Switch to day mode';
				icon: (Object iconNamed: #smallNew).
			model switchToNightMode ];
		whenDeactivatedDo: [
			switchButton
				label: 'Switch to night mode';
				icon: (Object iconNamed: #glamorousCloud).
			model switchToDayMode ].
	quitButton action: [ self delete ]
]

{ #category : #layout }
TrafficPresenter >> defaultLayout [
"two enclosed SpBoxLayout needed to bound the Morph"
	^ SpBoxLayout newHorizontal
	     spacing: 5;
		  add: (SpBoxLayout newVertical 
					add: view withConstraints: [ :c | c expand: false; height: 440; padding: 5 ];
					yourself ) withConstraints: [ :constr | constr width: 180; padding: 5 ];
		  add: (SpBoxLayout newVertical
					spacing: 5;
				   add: manualButton expand: false;
				   add: autoButton expand: false;
				   add: durationPanel;
				   addLast: switchButton expand: false;
				   addLast: quitButton expand: false;
				   yourself);
		  yourself
]

{ #category : #initialization }
TrafficPresenter >> initializeMorph [
	"build a morph view of a trafficlights"
	| body |
	body := BorderedMorph new
		        color: Color lightGray;
		        extent: 170 @ 440.
	body addAllMorphs: {
			(CircleMorph new
				 borderColor: Color darkGray;
				 extent: 120 @ 120;
				 position: body position + (25 @ 25)).
			(CircleMorph new
				 borderColor: Color darkGray;
				 extent: 120 @ 120;
				 position: body position + (25 @ 155)).
			(CircleMorph new
				 borderColor: Color darkGray;
				 extent: 120 @ 120;
				 position: body position + (25 @ 285)) }.
	^ body
]

{ #category : #initialization }
TrafficPresenter >> initializePresenters [

	| body |
	view := self instantiate: SpMorphPresenter.
	manualButton := self newButton.
	autoButton := self newButton.
	switchButton := self newToggleButton.
	quitButton := self newButton. 
	durationPanel := self instantiate: InputPanelPresenter.
	body := self initializeMorph.
	model := TrafficLights newWith: body.
	
	view morph: body.
	manualButton
		label: 'Manual switch';
		icon: (self iconNamed: #smallDoIt).
	autoButton
		label: 'Auto switch';
		icon: (self iconNamed: #tools).
	switchButton 
	   label: 'Switch to night mode';
	   icon: (self iconNamed: #glamorousCloud).
	quitButton
		label: 'Quit';
		icon: (self iconNamed: #smallQuit).
	durationPanel hide
]

{ #category : #initialization }
TrafficPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'Traffic Ligths Model by Pharo';
		initialExtent: 360 @ 475;
		aboutText: 'Model of Traffic Lights built with Spec.\\Can run under manual or automatic control.\Day and night modes are available.\\ (C) Serhiy Yaroshko, IFNUL, 2025' withCRs
]
