// place files you want to import through the `$lib` alias in this folder.
export default function parseInput(input: string): string {
    try {
        //devolver un texto de que funciono
        return "Todo bien";
    } catch (error) {
        return error as string;
    }

    return "Todo bien";
}