/**
 * CatCard.jsx
 * Componente de presentacion: muestra la tarjeta de un raza de gato
 * Recibe todos sus datos por props (no accede a servicios directamente)
 * Principio SOLID - S: Single Responsability / O : OplenClosed
 */
export default function CatCard({cat, imageUrl, liked, hasError, onSelect, onToggleLike, onImageError})
{


    return(
        
        <div className="card" onClick={() => onSelect(cat)}>
            {/* ── Imagen ── */}
            <div className="card-img-wrap">
                {hasError ? (
                    /* Placeholder cuando la imagen no carga */
                    <div className="img-error">
                        🐱
                        <span>Imagen no encontrada</span>
                    </div>
                ) : (
                    <img
                        src={imageUrl}
                        alt={cat.name}
                        onError={onImageError}
                    />
                )}
                {/* Overlay oscuro activado por CSS en hover */}
                <div className="card-overlay" />
            </div>

            {/* ── Texto ── */}
            <div className="card-body">
                <div className="card-name">{cat.name}</div>
                <div className="card-desc">{cat.desc}</div>
            </div>

            {/* ── Footer: badge + favorito ── */}
            <div className="card-footer">
         <span className="badge">Ver detalle →</span>
         {/* stopPropagation evita que el clic en el corazón abra el modal */}
         <button
          className="heart-btn"
          onClick={(e) => {
            e.stopPropagation();
            onToggleLike();
          }}
          aria-label={liked ? "Quitar de favoritos" : "Añadir a favoritos"}
        >
             {liked ? "❤️" : "🤍"}
             </button>
        </div>
        </div>




       /* Clic en la tarjeta - aber el modal de detalle*/
        

        /* Overlay oscuro activado por CSS en hover*/

        /* -- Texto --*/


        /* Footer: badge + favorito*/

        /* stopPropagation Evita que el click en el corazón abra el modal*/
        
      




    );
}

