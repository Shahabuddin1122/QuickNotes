import Image from "next/image";
const EditModal = ({isFav,deleteModal,addToFav}:{isFav?:boolean,deleteModal?:()=>void,addToFav?:()=>void}) => {
    return (
        <div className="w-[150px] border bg-sky-100 shadow-xl absolute top-0 -right-0 z-10">
            <div className="w-full rounded-lg flex items-center gap-4 px-4 py-3 cursor-pointer" onClick={deleteModal}>
                <Image src="/cross.svg" alt="edit" width={25} height={25}/>
                <p>Remove</p>
            </div>
            <div className={`w-full ${isFav? 'bg-amber-100':'bg-white'} rounded-lg flex items-center gap-4 px-4 py-3 cursor-pointer`} onClick={addToFav}>
                <Image src="/favourite.svg" alt="edit" width={25} height={25} />
                <p>{isFav? 'UnFavorite':'Favorite'}</p>
            </div>
        </div>
    );
};

export default EditModal;