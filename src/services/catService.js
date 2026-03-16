export const STORAGE_URL = import.meta.env.VITE_AZURE_STORAGE_URL;

export function getImageUrl(file) {
    return `${STORAGE_URL}/cats/${file}`;
}

export function getVideoURL(file) {
    const base = file.replace(/\.[^.]+$/, "");
    return `${STORAGE_URL}/cats-video/${base}.mp4`;
}

export function getPdfURL(file) {
    const base = file.replace(/\.[^.]+$/, ""); // "Maine_Coon.jpg" → "Maine_Coon"
    return `${STORAGE_URL}/cats-pdf/Ficha_${base}.pdf`;
}

export async function getCats() {
    return Promise.resolve([
        { file: "Abisinio.jpg",   name: "Abisinio",   desc: "Ágil y curioso, siempre en movimiento" },
        { file: "Bengala.jpg",    name: "Bengala",    desc: "Salvaje por fuera, tierno por dentro" },
        { file: "Maine_Coon.jpg", name: "Maine Coon", desc: "El gigante gentil de los gatos" },
        { file: "Pelo_Corto.jpg", name: "Pelo Corto", desc: "Elegante y de bajo mantenimiento" },
        { file: "Persa.jpg",      name: "Persa",      desc: "Majestuoso y tranquilo como un rey" },
        { file: "Ragdoll.jpg",    name: "Ragdoll",    desc: "Se derrite entre tus brazos" },
        { file: "Siames.jpg",     name: "Siamés",     desc: "Vocal, social y muy inteligente" },
        { file: "Sphynx.jpg",     name: "Sphynx",     desc: "Sin pelo, lleno de amor y calor" },
    ]);
}
