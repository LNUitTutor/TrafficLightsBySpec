Class {
	#name : #LampTest,
	#superclass : #TestCase,
	#category : #'TrafficLightsProject-Tests'
}

{ #category : #tests }
LampTest >> testCreation [

	| morph color lamp |
	morph := CircleMorph new.
	color := Color yellow.
	lamp := Lamp new: color for: 5 on: morph.
	self deny: lamp isSwitchedOn.
	self assert: lamp duration equals: 5.
	lamp switchOn.
	self assert: morph color equals: color
]

{ #category : #tests }
LampTest >> testInitialize [

	| lamp |
	lamp := Lamp new.
	self deny: lamp isSwitchedOn.
	self assert: lamp duration isNumber
]

{ #category : #tests }
LampTest >> testSwitchOnOff [

	| morph color lamp |
	morph := CircleMorph new.
	color := Color green.
	lamp := (Lamp new: color for: 10 on: morph) switchOn.
	self assert: lamp isSwitchedOn.
	self assert: morph color equals: color.
	lamp switchOff.
	self deny: lamp isSwitchedOn.
	self assert: morph color equals: Lamp passiveColor.
	lamp switchOn.
	self assert: lamp isSwitchedOn.
	self assert: morph color equals: color
]
