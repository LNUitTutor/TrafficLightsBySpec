Class {
	#name : #TrafficLightsTest,
	#superclass : #TestCase,
	#instVars : [
		'morph',
		'trafficLights'
	],
	#category : #'TrafficLightsProject-Tests'
}

{ #category : #running }
TrafficLightsTest >> setUp [
	super setUp.

	morph := BorderedMorph new.
	3 timesRepeat: [ morph addMorph: CircleMorph new ].
	trafficLights := TrafficLights newWith: morph
]

{ #category : #tests }
TrafficLightsTest >> testChangeLamp [

	trafficLights changeLamp.
	self assert: (morph submorphs at: 2) color equals: Lamp passiveColor.
	self assert: (morph submorphs at: 3) color equals: Color green.
	trafficLights changeLamp; changeLamp.
	self assert: (morph submorphs at: 1) color equals: Color red.
	self assert: (morph submorphs at: 2) color equals: Lamp passiveColor.
	self assert: (morph submorphs at: 3) color equals: Lamp passiveColor
]

{ #category : #tests }
TrafficLightsTest >> testNew [

	self should: [ TrafficLights new ] raise: Error
]

{ #category : #tests }
TrafficLightsTest >> testNewWith [

	self assert: (morph submorphs at: 2) color equals: Color yellow
]
