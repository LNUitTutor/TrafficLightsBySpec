"
I am a model of a traffic lights. I hold an array of Lamps.

###Instance Variables
	activeLamp:		<an Integer> an index of the switched on lamp
	lamps:		<an Array> of three Lamps and a fourth element that reference the second lamp
	mustRun:		<a Boolean> indicates if self is in a running mode
	stopwatch:		<a Stopwatch>
	view:		<a BorderedMorph> with three submorphs of the BaloonMorph class

###Public API and Key Messages

- run ""starts automatic switching""
- stop ""stops automatic switching""
- changeLamp ""switches next lamp""

To create an instance use the class method
```language=Pharo
newWith: aBorderedMorph
```
"
Class {
	#name : #TrafficLights,
	#superclass : #Object,
	#instVars : [
		'lamps',
		'activeLamp',
		'view',
		'mustRun',
		'stopwatch',
		'method'
	],
	#category : #'TrafficLightsProject-Model'
}

{ #category : #'instance creation' }
TrafficLights class >> new [

	^ self error:
		  'Should use newWith: aBorderedMorph to create an instance'
]

{ #category : #'instance creation' }
TrafficLights class >> newWith: aMorph [
	"aMorph has to be a BorderedMorph with three circle submorphs"
	^ self basicNew
		  view: aMorph;
		  initialize
]

{ #category : #action }
TrafficLights >> blinkLamp [

	| lamp |
	lamp := lamps at: activeLamp.
	lamp isSwitchedOn
		ifTrue: [ lamp switchOff ]
		ifFalse: [ lamp switchOn ]
]

{ #category : #action }
TrafficLights >> changeLamp [

	self perform: method 
]

{ #category : #initialization }
TrafficLights >> initialize [
	"The array of lamps contains three lamps and an additional reference to the yellow one.
	 The yellow lamp is active and switched on. The method of changing corresponds to day mode"
	lamps := {
		         (Lamp new: Color red for: 5 on: (view submorphs at: 1)).
		         (Lamp new: Color yellow for: 1 on: (view submorphs at: 2)).
		         (Lamp new: Color green for: 5 on: (view submorphs at: 3)).
		         nil }.
	lamps at: 4 put: (lamps at: 2).
	activeLamp := 2.
	(lamps at: activeLamp) switchOn.
	mustRun := false.
	stopwatch := Stopwatch new.
	method := #nextLamp
]

{ #category : #action }
TrafficLights >> nextLamp [
	"Always next lamp in the day mode"
	(lamps at: activeLamp) switchOff.
	activeLamp := activeLamp % 4 + 1.
	(lamps at: activeLamp) switchOn
]

{ #category : #action }
TrafficLights >> run [
	"starts execution of lamps changing"
	mustRun := true.
	[
	[ mustRun ] whileTrue: [
		stopwatch activate.
		[ stopwatch duration seconds < (lamps at: activeLamp) duration ]
			whileTrue: [  ].
		stopwatch reset.
		self changeLamp ] ] fork
]

{ #category : #accessing }
TrafficLights >> setDurations: anArray [
	"sets duration of each lamp"
	1 to: 3 do: [ :i | (lamps at: i) duration: (anArray at: i) ]
]

{ #category : #action }
TrafficLights >> stop [
	"stops execution of lamps changing"
	mustRun := false
]

{ #category : #action }
TrafficLights >> switchToDayMode [

	method := #nextLamp
]

{ #category : #action }
TrafficLights >> switchToNightMode [
	"at night mode the active lamp always is the yellow one"
	(lamps at: activeLamp) switchOff.
	activeLamp := 2.
	method := #blinkLamp
]

{ #category : #accessing }
TrafficLights >> view: aMorph [
	view := aMorph 
]
