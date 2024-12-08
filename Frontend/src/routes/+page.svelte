<script lang="ts">
    import parseInput from "$lib/parser";
    import CodeMirror from "svelte-codemirror-editor"
    import { oneDark } from "@codemirror/theme-one-dark"


    let editorText = $state("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    let result = $state("");
    
    function parse() {
        result = parseInput(editorText.trim());
    }
</script>
<h1 class="text-center text-2xl font-bold mb-4">Bienvenido al traductor de PEG a Fortran - Fase 1</h1>


<div class="p-5 flex flex-row h-full max-h-full">
    <div class="h-full w-1/2 mx-2 rounded-md border-black border overflow-y-scroll">
        <CodeMirror bind:value={editorText} on:change={parse} theme={oneDark}/>
    </div>
    <div class="rounded-md border-black border-2 h-full w-1/2 mx-2">
        <p>
            {result}
        </p>
    </div>
</div>