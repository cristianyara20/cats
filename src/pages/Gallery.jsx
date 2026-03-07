import "../styles/gallery.css"
import CatCard from "../components/catCard.jsx"
import CatDetail from "../components/catDetail.jsx"
import { useCats } from "../hooks/useCats"



export default function Gallery(){
    const{
        cats,
        loading,
        liked,
        errors,
        selected,
        likedCount,
        toggleLike,
        selectCat,
        closeCat,
        registerError,
        getImageUrl,
        getVideoUrl,
        getPdfUrl,
    } = useCats();

    if(loading){
        return(
            <div style={{color: "#8a70660", textAlign: "center", padding: "80px 0", fontFamily: "DM Sans, sans-serif"}}>
                Cargando Razas...
            </div>
        );
    }
    return(
        <>
        <div className="hero">
        {/* Huellitas decorativas animadas */}
        <div className="paw-bg" style={{ top: 20, left: "10%" }}>🐾</div>
        <div className="paw-bg" style={{ top: 60, right: "8%", animationDelay: "3s" }}>🐾</div>

        <div className="hero-tag">Azure Blob Storage · cats</div>
        <h1 className="hero-title">
          Nuestros<br /><em>Gaticos</em>
        </h1>
        <p className="hero-sub">{cats.length} razas · imágenes servidas desde Azure</p>
        <div className="divider" />
      </div>

        {likedCount > 0 && (
        <div className="count-bar">
          ❤️ Has marcado {likedCount} gato{likedCount > 1 ? "s" : ""} como favorito{likedCount > 1 ? "s" : ""}
        </div>
      )}

    
      <div className="grid">
        {cats.map((cat) => (
          <CatCard
            key={cat.name}
            cat={cat}
            imageUrl={getImageUrl(cat.file)}
            liked={!!liked[cat.name]}
            hasError={!!errors[cat.name]}
            onSelect={selectCat}
            onToggleLike={() => toggleLike(cat.name)}
            onImageError={() => registerError(cat.name)}
          />
        ))}
      </div>


        {selected && (
        <CatDetail
          cat={selected}
          imageUrl={getImageUrl(selected.file)}
          videoUrl={getVideoUrl(selected.name)}
          pdfUrl={getPdfUrl(selected.name)}
          hasError={!!errors[selected.name]}
          onClose={closeCat}
        />
      )}





        </>
    )
}