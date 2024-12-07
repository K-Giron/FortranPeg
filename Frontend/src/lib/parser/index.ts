import * as Parser from './peg-parser'

export default function parseInput(input: string){
    try {
        Parser.parse(input)
    } catch (e) {
        return e as string
    }
    return "It's all good!"
}

//agregando un comentario