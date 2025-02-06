# Combat Colliders

Easily set up both hurtboxes and hitboxes for any type of 2D game.

To use just add the combat collider node to a scene, I suggest under the sprite for better organization, and then use the buttons to modify the colliders. Then to actually make it so that works with the animation use the Animation's call method line to call the start(), end(), and next frame functions of the colliders.

For hurtboxes click the Is hitbox button twice to initialize it to the correct color and layer. 

This uses both layers 2 and 3 for player and enemies respectively.

This addon also allows for custom resources to be used to add to hitboxes that can be called with a signal such that when a hurtbox collides with a hitbox the damage and the extra resources get passed onto the signal
