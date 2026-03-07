import { useState, useEffect } from 'react';
import { getCats, getImageUrl, getVideoURL, getPdfURL } from "../services/catService";

export const useCats = () => {
    /* Hook useState */
    const [cats, setCats] = useState([]);
    const [loading, setLoading] = useState(true);
    const [liked, setLiked] = useState({});
    const [selected, setSelected] = useState(null);
    const [errors, setErrors] = useState({});

    /* Hook useEffect */
    useEffect(() => {
        getCats().then((data) => {
            setCats(data);
            setLoading(false);
        });
    }, []);

    /* Alternar me gusta de un gato */
    const toggleLike = (name) =>
        setLiked((prev) => ({ ...prev, [name]: !prev[name] }));

    /* Abre el modal para ver los detalles */
    const selectCat = (cat) => setSelected(cat);

    /* Cierra el modal */
    const closeCat = () => setSelected(null);

    /* Fallo al registrar la imagen de una raza, devuelve error */
    const registerError = (name) =>
        setErrors((prev) => ({ ...prev, [name]: true }));

    /* Contador de gatos marcados con me gusta */
    const likedCount = Object.values(liked).filter(Boolean).length;

    return {
        cats,
        loading,
        liked,
        selected,
        errors,
        likedCount,
        toggleLike,
        selectCat,
        closeCat,
        registerError,
        getImageUrl,
        getVideoUrl: getVideoURL,
        getPdfUrl: getPdfURL,
    };
};