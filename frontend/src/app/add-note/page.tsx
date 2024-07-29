import Side_bar from "@/components/side_bar";

const page = ()=>{
    return (
        <>
            <div className={"w-full h-screen flex"}>
                <Side_bar highlight={0}/>
            </div>
        </>
    )
}
export default page;