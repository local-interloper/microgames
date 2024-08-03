namespace engine.entities.core;

public class AbstractEntity
{
    public AbstractEntity(){

    }

    virtual public void Start() {

    }
    
    virtual public void Render() {

    }

    virtual public void Tick(float delta){
        
    }

    virtual public void OnDestroy() {

    }

    public void Destroy() {
        Engine.Scene?.Destroy(this);
    }
}

