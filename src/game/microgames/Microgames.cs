namespace game.microgames;

public static class Microgames {
    public static HashSet<MicrogameData> MicrogamesRegistry = [
        new MicrogameData {
            Name = "Balance",
            sceneGenerator = () => new Balance()
        }
    ];
}