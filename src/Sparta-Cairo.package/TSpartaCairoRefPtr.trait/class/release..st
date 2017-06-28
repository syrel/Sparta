finalization
release: aHandle
	| refCount |

	aHandle isNull
		"A handle may already be null, if garbage collector did his job before us :) "
		ifTrue: [ ^ self ].

	"amout of references before release"
	refCount := (self primRefCount: aHandle).
	refCount = 0
		ifTrue: [ 
			self warning: [ 'Trying to release a reference with 0 refCount!' ].
			^ self ].
	
	self warning: [ '(', aHandle value asString, ') RefCount: ', (refCount - 1) asString ].
	self primRelease: aHandle.

	refCount := refCount - 1.
	
	self
		assert: [ refCount >= 0 ]
		description: [ 'Reference count can only be positive!' ].
	
	"always nullify handle, since object gets garbage collected on pharo side"
	aHandle getHandle beNull