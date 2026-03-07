export default function catDetail({cat, imageUrl,videoUrl, pdfUrl, hasError, onClose}){

    return(
        <div className="modal-backdrop" onClick={onClose}>
            <div className="modal" onClick={(e) => e.stopPropagation()}>
                {/* ── Imagen ampliada ── */}
        {hasError ? (
          <div
            style={{
              height: 360,
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              fontSize: 80,
            }}
          >
            🐱
          </div>
        ) : (
          <img src={imageUrl} alt={cat.name} />
        )}
            </div>

        <div>
               

        {/* ── Cuerpo del modal ── */}
                <div>
                    <div className="modal-name">{cat.name}</div>
                    <div className="modal-desc">{cat.desc}</div>
                    {/* URL de la imagen */}
                    <div className="modal-url">{imageUrl}</div>

                    {/* ── Video desde Blob Storage ── */}
                    <video
                        controls
                        style={{
                            width: "100%",
                            borderRadius: 10,
                            marginBottom: 14,
                            background: "#0f0a06",
                        }}
                    >
                        <source src={videoUrl} type="video/mp4" />
                        Tu navegador no soporta video HTML5.
                    </video>

                    {/* ── Enlace al PDF de ficha técnica ── */}
                    <a
                        href={pdfUrl}
                        target="_blank"
                        rel="noopener noreferrer"
                        style={{
                            display: "block",
                            background: "#0f0a06",
                            border: "1px solid #2a1f12",
                            borderRadius: 8,
                            padding: "10px 14px",
                            fontFamily: "monospace",
                            fontSize: 11,
                            color: "#c8702a",
                            wordBreak: "break-all",
                            marginBottom: 16,
                            textDecoration: "none",
                        }}
                    >
                        📄 Ficha técnica PDF → {pdfUrl}
                    </a>


                    <button className="modal-close" onClick={onClose}>

                        Cerrar
                    </button>

                </div>
            </div>
        </div>


    )
}