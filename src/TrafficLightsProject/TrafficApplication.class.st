"
I can run a TrafficPresenter.
Use
```languge=Pharo
TrafficApplication new start. "" or ""
TrafficApplication example.
```
"
Class {
	#name : #TrafficApplication,
	#superclass : #SpApplication,
	#category : #'TrafficLightsProject-View'
}

{ #category : #examples }
TrafficApplication class >> example [

	<script>
	self new run
]

{ #category : #running }
TrafficApplication >> start [

	| window |
	window := (self newPresenter: TrafficPresenter) open.
	window window beUnresizeable; removeExpandBox.
]
