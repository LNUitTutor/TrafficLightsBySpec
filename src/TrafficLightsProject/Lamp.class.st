"
I am a model of a lamp and I am a part of a traffic lights model.
I know my color, duration of glow, state (on/off) and the reference to my view.

###Instance Variables
	color:		<a Color>
	duration:		<an Integer> (in seconds)
	switchedOn:		<a Boolean>
	view:		<a BaloonMorph>

To create an instance use the class method 
```language=Pharo
new: aColor for: time on: aMorph
```
###Public API 
- switchOn
- switchOff

"
Class {
	#name : #Lamp,
	#superclass : #Object,
	#instVars : [
		'color',
		'view',
		'duration',
		'switchedOn'
	],
	#category : #'TrafficLightsProject-Model'
}

{ #category : #'instance creation' }
Lamp class >> new: aColor for: time on: aMorph [
	"create an instance with the color, duration and view"
	^ self basicNew
		  color: aColor;
		  duration: time;
		  view: aMorph;
		  switchOff
]

{ #category : #constants }
Lamp class >> passiveColor [
	"color of an off lamp"
	^ Color lightGray lighter
]

{ #category : #accessing }
Lamp >> color: aColor [

	color := aColor
]

{ #category : #accessing }
Lamp >> duration [

	^ duration
]

{ #category : #accessing }
Lamp >> duration: aNumber [

	duration := aNumber
]

{ #category : #initialization }
Lamp >> initialize [
	"shouldn't be used"
	color := self class passiveColor.
	view := nil.
	duration := 1.
	switchedOn := false
]

{ #category : #accessing }
Lamp >> isSwitchedOn [

	^ switchedOn
]

{ #category : #printing }
Lamp >> printOn: aStream [

	super printOn: aStream.
	aStream nextPut: $(.
	color name printOn: aStream.
	aStream nextPut: $,.
	duration printOn: aStream.
	aStream nextPut: $)
]

{ #category : #action }
Lamp >> switchOff [
	"set the view's color to standard value"
	switchedOn := false.
	view color: self class passiveColor
]

{ #category : #action }
Lamp >> switchOn [
	"set the view's color to the lamp's color"
	switchedOn := true.
	view color: color
]

{ #category : #accessing }
Lamp >> view: aMorph [

	view := aMorph
]
