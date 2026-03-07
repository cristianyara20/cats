export const STOREGE_URL= import.meta.env.VITE_AZURE_STORAGE_URL;

/*
* Construye la URL completa de imagen para una raza.
 */
export function getImageUrl(file){
    return  `${STOREGE_URL}/cats/${file}`;
}

export function getVideoURL(name){
    return  `${STOREGE_URL}/cats-video/${name}`;
}

export function getPdfURL(file){
    return `${STOREGE_URL}/cats-pdf/${file}`;
}
export async function getCats() {
// Simula una llamada asíncrona para que el patrón sea reemplazable por fetch()
    return Promise.resolve([
        {
            file: "Abisinio.jpg",
            name: "Abisinio",
            desc: "Ágil y curioso, siempre en movimiento",
        },
        {
            file: "Bengala.jpg",
            name: "Bengala",
            desc: "Salvaje por fuera, tierno por dentro",
        },
        {
            file: "Maine_Coon.jpg",
            name: "Maine Coon",
            desc: "El gigante gentil de los gatos",
        },
        {
            file: "Pelo_Corto.jpg",
            name: "Pelo Corto",
            desc: "Elegante y de bajo mantenimiento",
        },
        {
            file: "Persa.jpg",
            name: "Persa",
            desc: "Majestuoso y tranquilo como un rey",
        },
        {
            file: "Ragdoll.jpg",
            name: "Ragdoll",
            desc: "Se derrite entre tus brazos",
        },
        {
            file: "Siames.jpg",
            name: "Siamés",
            desc: "Vocal, social y muy inteligente",
        },
        {
            file: "Sphynx.jpg",
            name: "Sphynx",
            desc: "Sin pelo, lleno de amor y calor",
        },
    ]);
}
