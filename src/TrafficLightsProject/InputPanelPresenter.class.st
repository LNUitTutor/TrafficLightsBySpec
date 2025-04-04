"
I am a helper presenter to input three integers.

###Public API and Key Messages

- redDuration
- yellowDuration
- greenDuration
- action: aBlock (set a reaction of the button)

###Instance Variables
	redInput:		<a NumberInput>
	yellowInput:		<a NumberInput>
	greenInput:		<a NumberInput>
	readyButton:		<a Button>

"
Class {
	#name : #InputPanelPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'redInput',
		'yellowInput',
		'greenInput',
		'readyButton'
	],
	#category : #'TrafficLightsProject-View'
}

{ #category : #accessing }
InputPanelPresenter >> action: aBlock [

	readyButton action: aBlock
]

{ #category : #initialization }
InputPanelPresenter >> connectPresenters [

	readyButton action: [
		Transcript show: '   Red - '; show: self redDuration printString; cr.
		Transcript show: 'Yellow - '; show: self yellowDuration printString; cr.
		Transcript show: ' Green - '; show: self greenDuration printString; cr.
		self hide ]
]

{ #category : #layout }
InputPanelPresenter >> defaultLayout [
	"Set durations of ligths"
	| grid |
	grid := SpGridLayout new
		  add: 'Set durations of ligths' at: 1 @ 1 span: 2 @ 1;
		  add: 'red' at: 1 @ 2;
		  add: redInput at: 2 @ 2;
		  add: 'yellow' at: 1 @ 3;
		  add: yellowInput at: 2 @ 3;
		  add: 'green' at: 1 @ 4;
		  add: greenInput at: 2 @ 4;
		  add: readyButton at: 1 @ 5 span: 2 @ 1;
		  yourself.
	grid borderWidth: 5"; borderColor: Color black".
	^ grid
]

{ #category : #accessing }
InputPanelPresenter >> greenDuration [

	^ greenInput number
]

{ #category : #initialization }
InputPanelPresenter >> initializePresenters [

	redInput := self newNumberInput
		            rangeMinimum: 1 maximum: 10;
		            number: 5;
		            yourself.
	yellowInput := self newNumberInput
		               rangeMinimum: 1 maximum: 10;
		               number: 2;
		               yourself.
	greenInput := self newNumberInput
		              rangeMinimum: 1 maximum: 10;
		              number: 5;
		              yourself.
	readyButton := self newButton
		               label: 'Ready';
		               icon: (self iconNamed: #smallOk);
		               yourself
]

{ #category : #initialization }
InputPanelPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Set durations of ligths';
		initialExtent: 200 @ 200
]

{ #category : #accessing }
InputPanelPresenter >> redDuration [

	^ redInput number
]

{ #category : #accessing }
InputPanelPresenter >> yellowDuration [

	^ yellowInput number
]
