namespace game.microgames;

public static class Microgames {
    public static List<MicrogameData> MicrogamesRegistry = [
        new MicrogameData {
            Name = "Balance",
            sceneGenerator = () => new Balance()
        }
    ];
}