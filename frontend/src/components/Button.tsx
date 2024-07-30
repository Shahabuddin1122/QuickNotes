const Button = ({text,submitData}:{text:string,submitData?:()=>void}) => {
    return (
        <>
            <button
                className={"text-lg font-semibold py-2 px-10 bg-green-300 rounded-lg"}
                onClick={submitData}
            >{text}</button>
        </>
    )
}
export default Button;