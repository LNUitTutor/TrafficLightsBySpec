Class {
	#name : #BaselineOfTrafficLightsProject,
	#superclass : #BaselineOf,
	#category : #BaselineOfTrafficLightsProject
}

{ #category : #baselines }
BaselineOfTrafficLightsProject >> baseline: spec [

	<baseline>
	spec for: #common do: [ spec package: 'TrafficLightsProject' ]
]

{ #category : #accessing }
BaselineOfTrafficLightsProject >> projectClass [
	^ MetacelloCypressBaselineProject
]
