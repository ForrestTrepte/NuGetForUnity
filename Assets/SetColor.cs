using UnityEngine;

public class SetColor : MonoBehaviour
{
    private void Start()
    {
        GetComponent<Renderer>().material.color = Color.green;//
    }
}
